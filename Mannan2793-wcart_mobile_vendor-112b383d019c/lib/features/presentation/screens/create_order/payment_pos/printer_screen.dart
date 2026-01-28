import 'package:flutter/material.dart';
import 'package:flutter_pos_printer_platform_image_3/flutter_pos_printer_platform_image_3.dart';
import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/add_pos/controller/poscontoller.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/payment_pos/contoller_payment.dart';

class ThermalPrinterScreen extends StatefulWidget {
  const ThermalPrinterScreen({Key? key}) : super(key: key);

  @override
  _ThermalPrinterScreenState createState() => _ThermalPrinterScreenState();
}

class _ThermalPrinterScreenState extends State<ThermalPrinterScreen> {
  PaymentController viewController = Get.put(PaymentController());
  // Printer variables
  List<PrinterDevice> _devices = [];
  PrinterDevice? _selectedPrinter;
  PrinterManager _printerManager = PrinterManager.instance;
  bool _isLoading = true;
  String _status = '';  

  @override
  void initState() {
    super.initState();
    _initPrinterManager();
  }

  Future<void> _initPrinterManager() async {
    _printerManager.discovery(type: PrinterType.usb).listen((device) {
      setState(() {
        _devices.add(device);
      });
    });

    // Wait a moment to allow discovery to find printers
    await Future.delayed(const Duration(seconds: 2));
    
    setState(() {
      _isLoading = false;
      if (_devices.isEmpty) {
        _status = 'No printers found';
      } else {
        _status = '${_devices.length} printer(s) found';
      }
    });
  }

  Future<void> _printReceipt() async {
    if (_selectedPrinter == null) {
      setState(() {
        _status = 'Please select a printer first';
      });
      return;
    }

    setState(() {
      _status = 'Connecting to printer...';
    });

    try {
      // Connect to the printer
      await _printerManager.connect(
        type: PrinterType.usb, // Replace with the appropriate type for your printer
        model: UsbPrinterInput(
          name: _selectedPrinter!.name,
          vendorId: _selectedPrinter!.vendorId,
          productId: _selectedPrinter!.productId,
        ),
      );

      setState(() {
        _status = 'Printing receipt...';
      });

      // Generate receipt
      final bytes = await _generateReceipt();
      
      // Print receipt
      final result = await _printerManager.send(type: PrinterType.usb, bytes: bytes);
      
      if (result) {
        setState(() {
          _status = 'Receipt printed successfully';
        });
      } else {
        setState(() {
          _status = 'Failed to print receipt';
        });
      }
    } catch (e) {
      setState(() {
        _status = 'Error: ${e.toString()}';
      });
    } finally {
      // Disconnect from printer
      _printerManager.disconnect(type: PrinterType.usb);
    }
  }

  Future<List<int>> _generateReceipt() async {
    // Generate ESC/POS commands for the receipt
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    List<int> bytes = [];

    // Store header
    bytes += generator.text('Wcart POS STORE',
        styles: PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
          bold: true,
        ));
    
    bytes += generator.text('B513, The Royal Castlw',
        styles: PosStyles(align: PosAlign.center));
    
    bytes += generator.text('Chennai, Tirumudivakam - 600044',
        styles: PosStyles(align: PosAlign.center));
    
    bytes += generator.text('Tel: +15155199991',
        styles: PosStyles(align: PosAlign.center));
    
    // Date and order info
    final now = DateTime.now();
    final dateStr = '${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}';
    
    bytes += generator.feed(1);
    bytes += generator.text('Date: $dateStr');
    bytes +=
        generator.text('Order #: ${viewController.createOrderData.orderid}');
    
    // Divider
    bytes += generator.hr();
    
    // Header
    bytes += generator.row([      
      PosColumn(
        text: 'ITEM ',
        width: 3,
        styles: PosStyles(bold: true,),
      ),
      PosColumn(
        text: 'Qty',
        width: 3, 
        styles: PosStyles(bold: true,height: PosTextSize.size1,width: PosTextSize.size1,align: PosAlign.right),
      ),
      PosColumn(
        text: 'Price',
        width: 3,
        styles: PosStyles(bold: true,height: PosTextSize.size1,width: PosTextSize.size1,align: PosAlign.right),
      ),
      
      PosColumn(
        text: 'Amt',
        width: 3,
        styles: PosStyles(bold: true,height: PosTextSize.size1,width: PosTextSize.size1,align: PosAlign.right),
      ),
    ]);
    
    // Divider
    bytes += generator.hr();
    
    // Items
    viewController.createOrderData.cartproducts!.forEach((element) {
    bytes += generator.row(multiLine: false,[      
        PosColumn(
          text: element.name.toString().length > 11
              ? "${element.name.toString().substring(0, 10)}.."
              : element.name.toString(),
          width: 5,
        ),
        PosColumn(
            text: '${element.quantity}',
            width: 1,
            styles: PosStyles(align: PosAlign.right)),
        PosColumn(
            text: '${element.price}',
            width: 3,
            styles: PosStyles(align: PosAlign.right)),
        PosColumn(
            text: '${element.price * element.quantity}',
            width: 3,
            styles: PosStyles(align: PosAlign.right)),
      ]);  
    });    
    
    // Divider
    bytes += generator.hr();
    
    // Totals
    bytes += generator.row([
      PosColumn(
        text: 'SUBTOTAL:',
        width: 8,
        styles: PosStyles(align: PosAlign.right),
      ),
      PosColumn(
        text:
            '${viewController.createOrderData.pricedata?.subtotal2.toString() ?? '0.00'}',
        width: 4,
        styles: PosStyles(align: PosAlign.right),
      ),
    ]);
    
    bytes += generator.row([
      PosColumn(
        text:
            'TAX (${viewController.createOrderData.pricedata?.tax.toString() ?? '0'}%):',
        width: 8,
        styles: PosStyles(align: PosAlign.right),
      ),
      PosColumn(
        text:
            viewController.createOrderData.pricedata?.taxvalue.toString() ??
            '0.00',
        width: 4,
        styles: PosStyles(align: PosAlign.right),
      ),
    ]);
    
    bytes += generator.hr();
    
    bytes += generator.row([
      PosColumn(
        text: 'TOTAL:',
        width: 8,
        styles: PosStyles(align: PosAlign.right, bold: true),
      ),
      PosColumn(
        text:
            '${viewController.createOrderData.pricedata?.subtotal1.toString() ?? '0.00'}',
        width: 4,
        styles: PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);
    
    bytes += generator.feed(1);
    
    // Payment info
    bytes += generator.text(
        'Payment: ${viewController.createOrderData.paymentgateway?.name.toString() ?? 'Cash'}',
        styles: PosStyles(align: PosAlign.center));
    
    // bytes += generator.text('Card: XXXX-XXXX-XXXX-1234',
    //     styles: PosStyles(align: PosAlign.center));
    
    bytes += generator.feed(1);
    
    // Footer
    bytes += generator.text('THANK YOU FOR YOUR BUSINESS!',
        styles: PosStyles(align: PosAlign.center, bold: true));
    
    bytes += generator.text('Please come again',
        styles: PosStyles(align: PosAlign.center));
    
    // Cut paper
    bytes += generator.cut();
    
    return bytes;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (viewController) {
      return Scaffold(
        backgroundColor: Colors.white,
          
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: const Text('Thermal Printer'),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Row(
                children: [printerWidget(context), receiptPreviewWidget()],
              ),
      );
    });
  }

  Widget receiptPreviewWidget() {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0, top: 16, bottom: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(8),
                color: Colors.grey[200],
                padding: const EdgeInsets.all(8),
                width:
                    // size.width * 0.2, // approximate width matching 58mm paper
                    size.width * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        'Wcart POS STORE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Center(child: Text('B513, The Royal Castlw')),
                    Center(child: Text('Chennai, Tirumudivakam - 600044')),
                    Center(child: Text('Tel: +15155199991')),
                    Divider(),
                    Text('Date: ${DateTime.now().toLocal()}'),
                    Text('Order #: ${viewController.createOrderData.orderid}'),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('ITEM',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Qty',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Price',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Amt',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Divider(),
                    Column(
                      children: viewController.createOrderData.cartproducts
                              ?.map((action) {
                            // Add your widget-building logic here
                            return buildItemRow(
                              action.name.toString(),
                              action.quantity.toString(),
                              action.price.toString(),
                              (action.price * action.quantity).toString(),
                            );
                          }).toList() ??
                          [],
                    ),                    
                    Divider(),
                    buildTotalRow(
                        'SUBTOTAL:',
                        viewController.createOrderData.pricedata?.subtotal2
                                .toString() ??
                            '0.00'),
                    buildTotalRow(
                        'TAX (${viewController.createOrderData.pricedata?.tax.toString() ?? '0'}%):',
                        viewController.createOrderData.pricedata?.taxvalue
                                .toString() ??
                            '0.00'),
                    Divider(),
                    buildTotalRow(
                        'TOTAL:',
                        viewController.createOrderData.pricedata?.subtotal1
                                .toString() ??
                            '0.00',
                        bold: true),
                    SizedBox(height: 8),
                    Center(
                        child: Text(
                        'Payment: ${viewController.createOrderData.paymentgateway?.name.toString() ?? 'Cash'}',
                      ),
                    ),
                    // Center(child: Text('Card: XXXX-XXXX-XXXX-1234')),
                    SizedBox(height: 8),
                    Center(
                      child: Text(
                        'THANK YOU FOR YOUR BUSINESS!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    Center(child: Text('Please come again')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemRow(String item, String qty, String price, String amt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 4, child: Text(item)),
        Expanded(flex: 1, child: Text(qty, textAlign: TextAlign.right)),
        Expanded(flex: 2, child: Text(price, textAlign: TextAlign.right)),
        Expanded(flex: 2, child: Text(amt, textAlign: TextAlign.right)),
      ],
    );
  }

  Widget buildTotalRow(String label, String value, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ],
    );
  }

  Expanded printerWidget(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'Available Printers:',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),                          
                _devices.isEmpty
                    ? const Text('No USB printers found')
                    : Expanded(
                        child: SingleChildScrollView(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 1.3,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _devices.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              final device = _devices[index];
                              return MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    _selectedPrinter = device;
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: Column(
                                      children: [
                                        RadioListTile<PrinterDevice>(
                                          title: Text(
                                            device.name,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // subtitle: Text(
                                          //   'VID: ${device.vendorId}, PID: ${device.productId}',
                                          // ),
                                          value: device,
                                          groupValue: _selectedPrinter,
                                          onChanged: (PrinterDevice? value) {
                                            setState(() {
                                              _selectedPrinter = value;
                                            });
                                          },
                                        ),
                                        // Text(
                                        //   device.name,
                                        //   style: const TextStyle(
                                        //     fontWeight: FontWeight.bold,
                                        //   ),
                                        // ),
                                        Image.asset(
                                          'assets/images/pos_image.jpg',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 16),
                    if (_status.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          _status,
                          style: TextStyle(
                            color: _status.contains('Error') ||
                                    _status.contains('Failed')
                                ? Colors.red
                                : _status.contains('success')
                                    ? Colors.green
                                    : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    const SizedBox(height: 16),
                    Row(
                      spacing: 5,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: _devices.isEmpty || _selectedPrinter == null
                                ? null
                                : _printReceipt,
                            child: Container(
                                width: 180,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.print),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    const Text('Print Receipt'),
                                  ],
                                )),
                          ),
                        ),
                        const SizedBox(height: 16),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _devices = [];
                                _selectedPrinter = null;
                                _isLoading = true;
                                _status = '';
                              });
                              _initPrinterManager();
                            },
                            child: Container(
                              width: 180,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.refresh),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  const Text('Refresh Printers'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
              ),
      ),
    );
  }
}