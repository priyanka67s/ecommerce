import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:flutter_pos_printer_platform_image_3/flutter_pos_printer_platform_image_3.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/payment_pos/printer_screen.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/pos_pdf/pdf_onfunction.dart';
// import 'package:network_info_plus/network_info_plus.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/add_pos/controller/poscontoller.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/payment_pos/contoller_payment.dart';
// import 'package:wcart_vendor/screens/pos_method/pos_pdf/pdf_onfunction.dart';
import 'package:wcart_vendor/util/color_resource.dart';
// import 'package:wcart_vendor/widgets/demo_drawer.dart';
import 'dart:io';
import 'dart:typed_data' show Uint8List;
import 'package:pdf/widgets.dart' as pw;
import 'package:file_selector/file_selector.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});
  static const String routeName = '/desktop_paymentsuccess';

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();

  final String pdfUrl =
      'https://www.example.com/sample.pdf'; // Replace with your PDF URL
  final String fileName = 'sample.pdf';
}

ViewOrderPosController viewController = Get.put(ViewOrderPosController());

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  PaymentController controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (contoller) {
      // print('screen status ---> ${controller.status.isLoading}');
      // if (controller.status.isLoading) {
      //   return Center(child: CircularProgressIndicator());
      // }
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: const Text(
            'Order Successful',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.offAllNamed(Routes.sideBar);
            },
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 700,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30.00),
                  child: Text(
                    'Thank You',
                    style:
                        TextStyle(fontSize: 30.00, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),                
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    padding: const EdgeInsets.all(10.00),
                    margin: const EdgeInsets.only(
                         top: 20.00),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.00),
                          child: Text(
                            'Your Order has been Placed Successfully',
                            style: TextStyle(
                              fontSize: 22.00,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.00),
                          child: Text(
                            // "Order ID - 2300 ",
                            'Order ID: ${contoller.createOrderData.cartproducts?[0].cartId ?? '2300'}',
                            style: TextStyle(fontSize: 18.00),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.00),
                          child: Text(
                            // "23400",
                            'Order Amount: ${contoller.createOrderData.amount.toString()}',
                            style: TextStyle(fontSize: 18.00),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin:
                              const EdgeInsets.only(left: 20.00, right: 20.00),
                          height: 2.00,
                          color: const Color(0xffe9e9e9),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.00),
                          margin: const EdgeInsets.only(top: 2.00),
                          child: Text(
                            'An Email Confirmation has been sent to - ${contoller.createOrderData.orderdata?[0].emailId.toString() ?? "Null"}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18.00,
                            ),
                          ),
                        )
                      ],
                    )
                    //  Column(
                    //     children: [
                    //       Container(
                    //         padding: EdgeInsets.all(10.00),
                    //         child: Text(
                    //           'Your Order gat failed',
                    //           style: TextStyle(
                    //               fontSize: 22.00, color: Colors.black),
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ),
                    //       Container(
                    //         width: double.infinity,
                    //         margin: EdgeInsets.only(left: 20.00, right: 20.00),
                    //         height: 2.00,
                    //         color: Color(0xffe9e9e9),
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.all(10.00),
                    //         margin: EdgeInsets.only(top: 2.00),
                    //         child: Text(
                    //           'Please order again this product',
                    //           style: TextStyle(fontSize: 18.00),
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        // width: double.infinity,
                        height: 50.00,
                        margin: const EdgeInsets.only(
                            top: 20.00, right: 10.00, left: 30.00),
                        decoration: BoxDecoration(
                            color: ColorResource.color0D5EF8,
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(2.0)),
                        child: MaterialButton(
                          height: 50.00,
                          onPressed: () async {
                            String url = controller.createOrderData.invoice
                                .toString(); // Your PDF URL

                            // Ask user to choose the save location and file name
                            final FileSaveLocation? location =
                                await getSaveLocation(
                              suggestedName: 'invoice',
                              acceptedTypeGroups: [
                                XTypeGroup(label: 'PDF', extensions: ['pdf']),
                              ],
                            );
                            if (location == null) {
                              // User canceled the picker
                              return;
                            }
                            final String path = location.path;
                            try {
                              await Dio().download(url, '$path.pdf');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Downloaded to $path")),
                              );
                            } catch (e) {
                              // Handle download error
                              print("Download failed: $e");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Download failed: $e")),
                              );
                            }
                          },



                          textColor: Colors.white,
                          child: const Text("GET RECEIPT"),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        // width: double.infinity,
                        height: 50.00,
                        margin: const EdgeInsets.only(
                            top: 20.00, right: 30.00, left: 30.00),
                        decoration: BoxDecoration(
                            color: ColorResource.color0D5EF8,
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(2.0)),
                        child: MaterialButton(
                          height: 50.00,
                          onPressed: () {
                            print('muthuvel');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ThermalPrinterScreen()));

                            // printReceipt1();
                            // Get.toNamed(Routes.pdfOnFunctionPage,
                            //     arguments: {
                            //       'invoice':
                            //           controller.createOrderData.invoice ??
                            //               "".toString(),
                            //     });
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             PdfOnFunctionPage()));
                          },
                          textColor: Colors.white,
                          child: const Text("VIEW INVOICE"),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  width: double.infinity,
                  height: 50.00,
                  margin: const EdgeInsets.only(
                      top: 20.00, right: 30.00, left: 30.00),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorResource.color0D5EF8),
                      // color: Colors.black,
                      borderRadius: BorderRadius.circular(2.0)),
                  child: MaterialButton(
                    height: 50.00,
                    onPressed: () {
                      Get.delete<ViewOrderPosController>();
                      Get.offAllNamed(Routes.sideBar);
                    },
                    textColor: Colors.black,
                    child: const Text("CONTINUE SHOPPING"),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20.00),
                  child: const Text(
                    'We have received your order.Your package will be delivered soon',
                    textAlign: TextAlign.center,
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 20.00),
                //   child: IconButton(
                //     icon: FaIcon(FontAwesomeIcons.whatsapp),
                //     color: Colors.green,
                //     iconSize: 50,
                //     onPressed: () async {
                //       final pdfPath = await _createSamplePdf();
                //       await sharePdfWithWhatsApp(
                //         "9566575593",
                //         // controller.createOrderData.orderdata![0].phone
                //         //     .toString(),
                //         pdfPath,
                //       );
                //     },
                //     // onPressed: () async {
                //     //   final pdfPath = await _createSamplePdf();
                //     //   await sharePdfWithWhatsApp(
                //     //       controller.createOrderData.orderdata![0].phone
                //     //           .toString(),
                //     //       pdfPath);
                //     // },
                //   ),
                // )
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<String> _createSamplePdf() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/example.pdf'; // Path to your PDF file

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('This is a sample PDF file content.'),
        ),
      ),
    );

    // Save the PDF file to the specified path
    final file = File(path);
    await file.writeAsBytes(await pdf.save());

    return path; // Return the path of the created PDF
  }

  Future<void> sharePdfWithWhatsApp(String phoneNumber, String pdfPath) async {
    // Check if the file exists
    if (await File(pdfPath).exists()) {
      // Share the PDF using share_plus
      await Share.shareXFiles(
        [XFile(pdfPath)], // Create an XFile from the PDF path
        text: "Here is your PDF!", // Optional message
      );

      // After sharing, you can optionally open WhatsApp with a message
      final message = controller.createOrderData.invoice;
      final encodedMessage = Uri.encodeComponent(message ?? "");
      final url =
          "https://api.whatsapp.com/send?phone=$phoneNumber&text=$encodedMessage";

      // Open the URL in WhatsApp
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
      }
    } else {
      print('PDF file does not exist at: $pdfPath');
    }
  }

  // Future<String> _createSamplePdf() async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final path = '${directory.path}/example.pdf'; // Path to your PDF file

  //   final pdf = pw.Document();

  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) => pw.Center(
  //         child: pw.Text('This is a sample PDF file content.'),
  //       ),
  //     ),
  //   );

  //   // Save the PDF file to the specified path
  //   final file = File(path);
  //   await file.writeAsBytes(await pdf.save());

  //   return path; // Return the path of the created PDF
  // }

  // Future<void> sharePdfWithWhatsApp(String phoneNumber, String pdfPath) async {
  //   // Check if the file exists
  //   if (await File(pdfPath).exists()) {
  //     // Encode the phone number and message for the URL
  //     final message = controller.createOrderData.invoice;
  //     final encodedMessage = Uri.encodeComponent(message ?? "");
  //     final url =
  //         "https://api.whatsapp.com/send?phone=$phoneNumber&text=$encodedMessage";

  //     // Open the URL in WhatsApp
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //       // Share the PDF using share_plus
  //       await Share.shareXFiles(
  //         [XFile(pdfPath)], // Create an XFile from the PDF path
  //         text: "Here is your PDF!", // Optional message
  //       );
  //     } else {
  //       print('Could not launch $url');
  //     }
  //   } else {
  //     print('PDF file does not exist at: $pdfPath');
  //   }
  // }

  // Future<String> _createSamplePdf() async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final path = '${directory.path}/example.pdf'; // Path to your PDF file

  //   final pdf = pw.Document();

  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) => pw.Center(
  //         child: pw.Text('This is a sample PDF file content.'),
  //       ),
  //     ),
  //   );

  //   // Save the PDF file to the specified path
  //   final file = File(path);
  //   await file.writeAsBytes(await pdf.save());

  //   return path; // Return the path of the created PDF
  // }

  // Future<void> sharePdfWithWhatsApp(String pdfPath) async {
  //   // Check if the file exists
  //   if (await File(pdfPath).exists()) {
  //     // Share the PDF file
  //     await Share.shareXFiles(
  //       [XFile(pdfPath)], // Create an XFile from the PDF path
  //       text: "Here is the PDF!", // Optional message
  //     );
  //   } else {
  //     print('PDF file does not exist at: $pdfPath');
  //   }
  // }

  // Future<void> shareTextWithWhatsApp(String phoneNumber, String message) async {
  //   // Encode the message and phone number for the URL
  //   final encodedMessage = Uri.encodeComponent(message);
  //   final url =
  //       "https://api.whatsapp.com/send?phone=$phoneNumber&text=$encodedMessage";

  //   // Open the URL in the browser or WhatsApp
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     print('Could not launch $url');
  //   }
  // }
//!static content
  


//! dynamic content
  Future<void> printReceipt() async {
    // Load the printer's capability profile asynchronously
    final profile = await CapabilityProfile.load(name: 'default');

    // Create the generator for the receipt content
    final generator = Generator(PaperSize.mm80, profile);

    // Create a list to hold the receipt's bytes
    List<int> bytes = [];

    // Add the store name to the receipt
    bytes += generator.text(
      controller.createOrderData.storeLocationDetails?.locationTitle ?? "",
      styles: PosStyles(align: PosAlign.center, bold: true),
      linesAfter: 1,
    );

    // Add the store address
    bytes += generator.text(
        controller.createOrderData.storeLocationDetails?.addressline1 ?? "",
        styles: const PosStyles(align: PosAlign.center));
    bytes += generator.text(
        controller.createOrderData.storeLocationDetails?.cityName ?? "",
        styles: const PosStyles(align: PosAlign.center));
    bytes += generator.hr(); // Add a horizontal line

    // Add a header for the items
    bytes += generator.text(
      'Item                Qty     Price',
      styles: const PosStyles(bold: true),
    );
    bytes += generator.hr(); // Add another horizontal line

    // Add each item from the order to the receipt with proper alignment
    for (var product in controller.createOrderData.cartproducts!) {
      final name = product.name; // The name of the product
      final qty = product.quantity; // The quantity of the product
      final price = product.price?.toString(); // The price of the product

      // Use fixed-width formatting for better alignment
      bytes += generator.row([
        PosColumn(
          text: name.toString(),
          width: 6, // Adjust based on the length of your item names
        ),
        PosColumn(
          text: qty.toString(),
          width: 3,
          styles: PosStyles(align: PosAlign.right),
        ),
        PosColumn(
          text: '\$$price',
          width: 3,
          styles: PosStyles(align: PosAlign.right),
        ),
      ]);
    }

    bytes += generator.hr(); // Add another horizontal line

    // Add the total amount
    bytes += generator.text(
      'Total: \$${controller.createOrderData.amount?.toStringAsFixed(2)}',
      styles: const PosStyles(align: PosAlign.right, bold: true),
    );

    // Feed some extra lines to the receipt
    bytes += generator.feed(2);

    // Cut the paper at the end of the receipt
    bytes += generator.cut();

    // Send the generated bytes to the printer
    await controller.sendBytesToPrint(bytes, PrinterType.usb);
  }

  // Future<void> printReceipt() async {
  //   // Load the printer's capability profile asynchronously
  //   final profile = await CapabilityProfile.load(name: 'default');

  //   // Create the generator for the receipt content
  //   final generator = Generator(PaperSize.mm80, profile);

  //   // Create a list to hold the receipt's bytes
  //   List<int> bytes = [];

  //   // Add the store name to the receipt
  //   bytes += generator.text(
  //     'Store Name',
  //     styles: PosStyles(align: PosAlign.center, bold: true),
  //     linesAfter: 1,
  //   );

  //   // Add the store address
  //   bytes += generator.text('123 Main St.');
  //   bytes += generator.text('City, Country');
  //   bytes += generator.hr(); // Add a horizontal line

  //   // Add a header for the items
  //   bytes += generator.text('Item             Qty     Price');

  //   // Add each item from the order to the receipt
  //   for (var product in controller.createOrderData.cartproducts!) {
  //     final name = product.name; // The name of the product
  //     final qty = product.quantity; // The quantity of the product
  //     final price = product.price; // The price of the product
  //     bytes += generator.text(
  //       '$name       $qty    \$${price?.toString()}',
  //     );
  //   }
  //   bytes += generator.hr(); // Add another horizontal line

  //   // Add the total amount
  //   bytes += generator.text(
  //     'Total: ${controller.createOrderData.amount.toString()}',
  //     styles: PosStyles(align: PosAlign.right, bold: true),
  //   );

  //   // Feed some extra lines to the receipt
  //   bytes += generator.feed(2);

  //   // Cut the paper at the end of the receipt
  //   bytes += generator.cut();

  //   // Send the generated bytes to the printer
  //   await controller.sendBytesToPrint(bytes, PrinterType.usb);

  //   // If using a specific type of printer (e.g., Network Printer), additional steps may be required.
  //   // For example, sending data to a network printer could look like this:
  //   //
  //   // final printer = NetworkPrinter(PaperSize.mm80, profile);
  //   // final res = await printer.connect('192.168.0.123', port: 9100);
  //   // if (res == PosPrintResult.success) {
  //   //   printer.sendBytes(bytes);
  //   //   printer.disconnect();
  //   // } else {
  //   //   print('Could not connect to the printer');
  //   // }
  // }

  // Future<void> printReceipt() async {
  //   // Load the printer's capability profile asynchronously
  //   final profile = await CapabilityProfile.load(name: 'default');

  //   // Create the generator
  //   final generator = Generator(PaperSize.mm80, profile);

  //   // Generate the receipt content
  //   List<int> bytes = [];

  //   // Add the store name
  //   bytes += generator.text(
  //     'Store Name',
  //     styles: PosStyles(align: PosAlign.center, bold: true),
  //     linesAfter: 1,
  //   );

  //   // Add the store address
  //   bytes += generator.text('123 Main St.');
  //   bytes += generator.text('City, Country');
  //   bytes += generator.hr(); // Horizontal line

  //   // Add the header for items
  //   bytes += generator.text('Item         Qty  Price');

  //   // Add each item
  //   for (var product in controller.createOrderData.cartproducts!) {
  //     final name = product.name; // Replace with actual field name
  //     final qty = product.quantity; // Replace with actual field name
  //     final price = product.price; // Replace with actual field name
  //     bytes += generator.text(
  //       '$name       $qty    \$${price?.toString()}',
  //     );
  //   }
  //   bytes += generator.hr(); // Horizontal line

  //   // Add the total
  //   bytes += generator.text(
  //     'Total: ${controller.createOrderData.amount.toString()}',
  //     styles: PosStyles(align: PosAlign.right, bold: true),
  //   );

  //   // Feed some lines
  //   bytes += generator.feed(2);

  //   // Cut the paper
  //   bytes += generator.cut();

  //   // Now you can send `bytes` to the printer using the appropriate method
  //   await controller.sendBytesToPrint();

  //   // For example, you can send it via Bluetooth or Network

  //   // Example for Network Printer (using `esc_pos_printer`):
  //   // final printer = NetworkPrinter(PaperSize.mm80, profile);
  //   // final res = await printer.connect('192.168.0.123', port: 9100);
  //   // if (res == PosPrintResult.success) {
  //   //   printer.sendBytes(bytes);
  //   //   printer.disconnect();
  //   // } else {
  //   //   print('Could not connect to the printer');
  //   // }
  // }

  // Future<void> printReceipt() async {
  //   // Load the printer's capability profile
  //   final profile = await CapabilityProfile.load(name: 'default');

  //   // Create the generator
  //   final generator = Generator(PaperSize.mm80, profile);

  //   // Generate the receipt content
  //   List<int> bytes = [];

  //   // Add the store name
  //   bytes += generator.text(
  //     controller.createOrderData.cartproducts![0].cartId.toString(),
  //     styles: PosStyles(align: PosAlign.center, bold: true),
  //     linesAfter: 1,
  //   );

  //   // Add the store address
  //   bytes += generator.text('123 Main ');
  //   bytes += generator.text('City, Country');
  //   bytes += generator.hr(); // Horizontal line

  //   // Add the header for items
  //   bytes += generator.text('Item                Qty  Price');

  //   // Add each item
  //   for (var product in controller.createOrderData.cartproducts!) {
  //     final name = product.name; // Replace with actual field name
  //     final qty = product.quantity; // Replace with actual field name
  //     final price = product.price; // Replace with actual field name

  //     // Ensure price is a number before calling toStringAsFixed
  //     final priceString = price is num ? price.toStringAsFixed(2) : 'N/A';

  //     bytes += generator.text(
  //       '$name                $qty    \$$priceString',
  //     );
  //   }
  //   bytes += generator.hr(); // Horizontal line

  //   // Add the total
  //   bytes += generator.text(
  //     'Total: \$${controller.createOrderData.amount.toString()}',
  //     styles: PosStyles(align: PosAlign.right, bold: true),
  //   );

  //   // Feed some lines
  //   bytes += generator.feed(2);

  //   // Cut the paper
  //   bytes += generator.cut();

  //   // Send the generated bytes to the printer
  //   await sendToNetworkPrinter(bytes);
  // }

  // Future connectDevice(PrinterDevice selectedPrinter, PrinterType type,
  //     {bool reconnect = false,
  //     bool isBle = false,
  //     String? ipAddress = null}) async {
  //   switch (type) {
  //     // only windows and android
  //     case PrinterType.usb:
  //       await PrinterManager.instance.connect(
  //           type: type,
  //           model: UsbPrinterInput(
  //               name: selectedPrinter.name,
  //               productId: selectedPrinter.productId,
  //               vendorId: selectedPrinter.vendorId));
  //       break;
  //     // only iOS and android
  //     case PrinterType.bluetooth:
  //       await PrinterManager.instance.connect(
  //           type: type,
  //           model: BluetoothPrinterInput(
  //               name: selectedPrinter.name,
  //               address: selectedPrinter.address!,
  //               isBle: isBle,
  //               autoConnect: reconnect));
  //       break;
  //     case PrinterType.network:
  //       await PrinterManager.instance.connect(
  //           type: type,
  //           model: TcpPrinterInput(
  //               ipAddress: ipAddress ?? selectedPrinter.address!));
  //       break;
  //     default:
  //   }
  // }

  // Future<void> connectToPrinter(List<int> bytes,
  //     {String? ipAddress, bool isBle = false, bool reconnect = false}) async {
  //   PrinterDevice?
  //       selectedPrinter; // Set this based on your printer selection logic

  //   // Assuming selectedPrinter is set and has been selected by the user
  //   if (selectedPrinter != null) {
  //     PrinterType? type;

  //     switch (selectedPrinter.DeviceType) {
  //       case DeviceType.usb:
  //         type = PrinterType.usb;
  //         break;
  //       case DeviceType.bluetooth:
  //         type = PrinterType.bluetooth;
  //         break;
  //       case DeviceType.network:
  //         type = PrinterType.network;
  //         break;
  //       default:
  //         print('Unsupported printer type');
  //         return;
  //     }

  //     if (type != null) {
  //       // Connect and send data to the printer
  //       await _connectDevice(
  //         selectedPrinter,
  //         type,
  //         reconnect: reconnect,
  //         isBle: isBle,
  //         ipAddress: ipAddress,
  //         bytes: bytes,
  //       );
  //     }
  //   } else {
  //     print('No printer selected');
  //   }
  // }

  // Future<void> _connectDevice(PrinterDevice selectedPrinter, PrinterType type,
  //     {bool reconnect = false,
  //     bool isBle = false,
  //     String? ipAddress,
  //     required List<int> bytes}) async {
  //   // Your implementation to connect and send data to the printer
  //   // For example:
  //   switch (type) {
  //     case PrinterType.usb:
  //       await PrinterManager.instance.connect(
  //         type: type,
  //         model: UsbPrinterInput(
  //           name: selectedPrinter.name,
  //           productId: selectedPrinter.productId,
  //           vendorId: selectedPrinter.vendorId,
  //         ),
  //       );
  //       break;
  //     case PrinterType.bluetooth:
  //       await PrinterManager.instance.connect(
  //         type: type,
  //         model: BluetoothPrinterInput(
  //           name: selectedPrinter.name,
  //           address: selectedPrinter.address!,
  //           isBle: isBle,
  //           autoConnect: reconnect,
  //         ),
  //       );
  //       break;
  //     case PrinterType.network:
  //       await PrinterManager.instance.connect(
  //         type: type,
  //         model: TcpPrinterInput(
  //           ipAddress: ipAddress ?? selectedPrinter.address!,
  //         ),
  //       );
  //       break;
  //     default:
  //       print('Unsupported printer type');
  //       return;
  //   }

  //   // Send the data to the printer
  //   // await PrinterManager.instance.send(bytes);
  //   await PrinterManager.instance.disconnect(type: type);
  // }

  // Future<void> connectToPrinter(List<int> bytes,
  //     {String? ipAddress, bool isBle = false, bool reconnect = false}) async {
  //   PrinterDevice?
  //       selectedPrinter; // You'll need to set this based on your printer selection logic

  //   // Assuming selectedPrinter is set and has been selected by the user
  //   if (selectedPrinter != null) {
  //     PrinterType type;

  //     // Determine the printer type
  //     if (selectedPrinter.isUSB) {
  //       type = PrinterType.usb;
  //     } else if (selectedPrinter.isBluetooth) {
  //       type = PrinterType.bluetooth;
  //     } else if (selectedPrinter.isNetwork) {
  //       type = PrinterType.network;
  //     } else {
  //       print('Unsupported printer type');
  //       return;
  //     }

  //     // Connect and send data to the printer
  //     await _connectDevice(selectedPrinter, type,
  //         reconnect: reconnect,
  //         isBle: isBle,
  //         ipAddress: ipAddress,
  //         bytes: bytes);
  //   } else {
  //     print('No printer selected');
  //   }
  // }

  // Future<void> _connectDevice(PrinterDevice selectedPrinter, PrinterType type,
  //     {bool reconnect = false,
  //     bool isBle = false,
  //     String? ipAddress,
  //     required List<int> bytes}) async {
  //   switch (type) {
  //     case PrinterType.usb:
  //       await PrinterManager.instance.connect(
  //         type: type,
  //         model: UsbPrinterInput(
  //           name: selectedPrinter.name,
  //           productId: selectedPrinter.productId,
  //           vendorId: selectedPrinter.vendorId,
  //         ),
  //       );
  //       break;
  //     case PrinterType.bluetooth:
  //       await PrinterManager.instance.connect(
  //         type: type,
  //         model: BluetoothPrinterInput(
  //           name: selectedPrinter.name,
  //           address: selectedPrinter.address!,
  //           isBle: isBle,
  //           autoConnect: reconnect,
  //         ),
  //       );
  //       break;
  //     case PrinterType.network:
  //       await PrinterManager.instance.connect(
  //         type: type,
  //         model: TcpPrinterInput(
  //           ipAddress: ipAddress ?? selectedPrinter.address!,
  //         ),
  //       );
  //       break;
  //     default:
  //       print('Unsupported printer type');
  //       return;
  //   }

  //   // Send the data to the printer
  //   // await PrinterManager.instance.send(bytes);
  //   await PrinterManager.instance.disconnect(type: type);
  // }
}

// Future<void> sendToNetworkPrinter() async {
//   final profile = await CapabilityProfile.load();
//   final printer = NetworkPrinter(PaperSize.mm80, profile);

//   // Replace with your printer's IP address and port
//   const printerAddress = '192.168.0.123';
//   const printerPort = 9100;

//   // Connect to the printer
//   final res = await printer.connect(printerAddress, port: printerPort);

//   if (res == PosPrintResult.success) {
//     try {
//       // Send data to the printer
//       final bytes = [
//         0x1B, 0x40, // Initialize printer
//         0x1B, 0x61, 0x01, // Center alignment
//         0x1B, 0x21, 0x10, // Double height
//         ...'Test Print Page\n'.codeUnits,
//         0x1B, 0x21, 0x00, // Normal size
//         0x0A, // New line
//       ];
//       printer.rawBytes(bytes);
//     } catch (e) {
//       print('Failed to send bytes: $e');
//     } finally {
//       // Disconnect from the printer
//       printer.disconnect();
//     }
//   } else {
//     print('Could not connect to the printer');
//   }
// }

// Future<void> sendToNetworkPrinter() async {
//   final printer = PosPrinter();

//   // Replace with your printer's IP address and port
//   final printerAddress = '192.168.0.123';
//   final printerPort = 9100;

//   // Connect to the printer
//   final res = await printer.connect(printerAddress, port: printerPort);

//   if (res == PosPrintResult.success) {
//     try {
//       // Send data to the printer
//       // Example text to print
//       final bytes = [
//         0x1B, 0x40, // Initialize printer
//         0x1B, 0x61, 0x01, // Center alignment
//         0x1B, 0x21, 0x10, // Double height
//         ...'Test Print Page\n'.codeUnits,
//         0x1B, 0x21, 0x00, // Normal size
//         0x0A, // New line
//       ];
//       await printer.rawBytes(bytes);
//     } catch (e) {
//       print('Failed to send bytes: $e');
//     } finally {
//       // Disconnect from the printer
//       await printer.disconnect();
//     }
//   } else {
//     print('Could not connect to the printer');
//   }
// }

//   Future<void> sendToNetworkPrinter(List<int> bytes) async {
//     print('muthu print');
//     final profile = await CapabilityProfile.load(name: 'default');
//     final printer = NetworkPrinter(PaperSize.mm80, profile);

//     final res = await printer.connect('192.168.0.123', port: 9100);

//     if (res == PosPrintResult.success) {
//       printer.rawBytes(bytes);
//       printer.disconnect();
//     } else {
//       print('Could not connect to the printer');
//     }
//   }
// }

// Future<void> printReceipt() async {
//   print('muthuvel');
//   // Load the printer's capability profile
//   final profile = await CapabilityProfile.load(name: 'default');

//   // Create the generator
//   final generator = Generator(PaperSize.mm80, profile);

//   // Generate the receipt content
//   List<int> bytes = [];

//   // Add the store name
//   bytes += generator.text(
//     controller.createOrderData.cartproducts![0].cartId.toString(),
//     styles: PosStyles(align: PosAlign.center, bold: true),
//     linesAfter: 1,
//   );

//   // Add the store address
//   bytes += generator.text('123 Main ');
//   bytes += generator.text('City, Country');
//   bytes += generator.hr(); // Horizontal line

//   // Add the header for items
//   bytes += generator.text('Item                Qty  Price');

//   // Add each item
//   for (var product in controller.createOrderData.cartproducts!) {
//     final name = product.name; // Replace with actual field name
//     final qty = product.quantity; // Replace with actual field name
//     final price = product.price; // Replace with actual field name
//     bytes += generator.text(
//       '$name                $qty    \$${price?.toString()}',
//     );
//   }
//   bytes += generator.hr(); // Horizontal line

//   // Add the total
//   bytes += generator.text(
//     'Total: ${controller.createOrderData.amount.toString()}',
//     styles: PosStyles(align: PosAlign.right, bold: true),
//   );

//   // Feed some lines
//   bytes += generator.feed(2);

//   // Cut the paper
//   bytes += generator.cut();

//   // Now you can send `bytes` to the printer using the appropriate method
//   // For example, you can send it via Bluetooth or Network

//   // Example for Network Printer (using `esc_pos_printer`):
//   // final printer = NetworkPrinter(PaperSize.mm80, profile);
//   // final res = await printer.connect('192.168.0.123', port: 9100);
//   // if (res == PosPrintResult.success) {
//   //   printer.sendBytes(bytes);
//   //   printer.disconnect();
//   // } else {
//   //   print('Could not connect to the printer');
//   // }
// }

// Future<void> printReceipt() async {
//   print('muthuvel');
//   // Load the printer's capability profile
//   final profile = await CapabilityProfile.load(name: 'default');

//   // Create the generator
//   final generator = Generator(PaperSize.mm80, profile);

//   // Generate the receipt content
//   List<int> bytes = [];

//   // Add the store name
//   bytes += generator.text(
//     controller.createOrderData.cartproducts![0].cartId.toString(),
//     styles: PosStyles(align: PosAlign.center, bold: true),
//     linesAfter: 1,
//   );

//   // Add the store address
//   bytes += generator.text('123 Main ');
//   bytes += generator.text('City, Country');
//   bytes += generator.hr(); // Horizontal line

//   // Add the items
//   bytes += generator.text('Item                Qty  Price');
//   bytes += generator.text('Item 1              1    \$10.00');
//   bytes += generator.text('Item 2              2    \$20.00');
//   bytes += generator.hr(); // Horizontal line

//   // Add the total
//   bytes += generator.text(
//     'Total: ${controller.createOrderData.amount.toString()}',
//     styles: PosStyles(align: PosAlign.right, bold: true),
//   );

//   // Feed some lines
//   bytes += generator.feed(2);

//   // Cut the paper
//   bytes += generator.cut();

//   // Now you can send `bytes` to the printer using the appropriate method
//   // For example, you can send it via Bluetooth or Network

//   // Example for Network Printer (using `esc_pos_printer`):
//   // final printer = NetworkPrinter(PaperSize.mm80, profile);
//   // final res = await printer.connect('192.168.0.123', port: 9100);
//   // if (res == PosPrintResult.success) {
//   //   printer.sendBytes(bytes);
//   //   printer.disconnect();
//   // } else {
//   //   print('Could not connect to the printer');
//   // }

// _connectDevice(PrinterDevice selectedPrinter, PrinterType type,
//     {bool reconnect = false,
//     bool isBle = false,
//     String? ipAddress = null}) async {
//   switch (type) {
//     // only windows and android
//     case PrinterType.usb:
//       await PrinterManager.instance.connect(
//           type: type,
//           model: UsbPrinterInput(
//               name: selectedPrinter.name,
//               productId: selectedPrinter.productId,
//               vendorId: selectedPrinter.vendorId));
//       break;
//     // only iOS and android
//     case PrinterType.bluetooth:
//       await PrinterManager.instance.connect(
//           type: type,
//           model: BluetoothPrinterInput(
//               name: selectedPrinter.name,
//               address: selectedPrinter.address!,
//               isBle: isBle,
//               autoConnect: reconnect));
//       break;
//     case PrinterType.network:
//       await PrinterManager.instance.connect(
//           type: type,
//           model: TcpPrinterInput(
//               ipAddress: ipAddress ?? selectedPrinter.address!));
//       break;
//     default:
//   }
// }

// Future<void> sendToNetworkPrinter(List<int> bytes) async {
//   print('Attempting to connect to the printer...');
//   final profile = await CapabilityProfile.load(name: 'default');
//   final printer = NetworkPrinter(PaperSize.mm80, profile);

//   try {
//     final res = await printer.connect('192.168.0.123', port: 9100);

//     if (res == PosPrintResult.success) {
//       print('Connected to the printer');
//       printer.rawBytes(bytes);
//       printer.disconnect();
//       print('Printing completed successfully');
//     } else {
//       print('Failed to connect to the printer. Result: ${res.toString()}');
//       // Print additional error details if available
//       if (res == PosPrintResult.timeout) {
//         print('Connection timed out.');
//       } else if (res == PosPrintResult) {
//         print('Printer not connected.');
//       } else if (res == PosPrintResult) {
//         print('Printer not responding.');
//       } else if (res == PosPrintResult.ticketEmpty) {
//         print('No data to print.');
//       } else if (res == PosPrintResult.printInProgress) {
//         print('A print job is already in progress.');
//       } else if (res == PosPrintResult) {
//         print('Operation not supported.');
//       } else {
//         print('Unknown error occurred.');
//       }
//     }
//   } catch (e) {
//     print('Error occurred while connecting to the printer: $e');
//   }
// }

// }
// Future<void> sendToNetworkPrinter(List<int> bytes) async {
//   print('Attempting to connect to the printer...');
//   final profile = await CapabilityProfile.load(name: 'default');
//   final printer = NetworkPrinter(PaperSize.mm80, profile);

//   try {
//     final res = await printer.connect('192.168.0.123', port: 9100);

//     if (res == PosPrintResult.success) {
//       print('Connected to the printer');
//       printer.rawBytes(bytes);
//       printer.disconnect();
//       print('Printing completed successfully');
//     } else {
//       print('Failed to connect to the printer. Result: ${res.toString()}');
//     }
//   } catch (e) {
//     print('Error occurred while connecting to the printer: $e');
//   }
// }

// Future<void> sendToNetworkPrinter(List<int> bytes) async {
//   print('muthu print');
//   final profile = await CapabilityProfile.load(name: 'default');
//   final printer = NetworkPrinter(PaperSize.mm80, profile);

//   final res = await printer.connect('192.168.0.123', port: 9100);

//   if (res == PosPrintResult.success) {
//     printer.rawBytes(bytes);
//     printer.disconnect();
//   } else {
//     print('Could not connect to the printer');
//   }
// }

// Future<void> sendToNetworkPrinter(List<int> bytes) async {
//   try {
//     final profile = await CapabilityProfile.load(name: 'default');
//     final printer = NetworkPrinter(PaperSize.mm80, profile);

//     final res = await printer.connect('192.168.0.123', port: 9100);

//     if (res == PosPrintResult.success) {
//       printer.sendBytes(bytes);
//       await printer.disconnect();
//     } else {
//       print('Could not connect to the printer');
//     }
//   } catch (e) {
//     print('Error printing: $e');
//   }
// }

// Future<void> printReceipt() async {
//   try {
//     // Initialize the printer instance
//     BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

//     // Check if the printer is connected
//     bool isConnected = (await bluetooth.isConnected) ?? false;
//     if (!isConnected) {
//       // Get bonded devices (already paired)
//       List<BluetoothDevice> devices = await bluetooth.getBondedDevices();
//       if (devices.isNotEmpty) {
//         // Connect to the first device (assuming the printer is the first in the list)
//         await bluetooth.connect(devices.first);
//       } else {
//         print('No bonded devices found');
//         return;
//       }
//     }

//     // Generate the receipt content
//     List<int> bytes = await createReceiptContent();

//     // Print the receipt
//     await bluetooth.writeBytes(Uint8List.fromList(bytes));

//     print('Print successful');
//   } catch (e) {
//     print('Error printing: $e');
//   }
// }

// Future<List<int>> createReceiptContent() async {
//   List<int> bytes = [];

//   // Generate your receipt content here, similar to previous examples

//   return bytes;
// }
// }

// Future<List<String>> discoverPrinters() async {
//   List<String> printers = [];
//   final info = NetworkInfo();
//   final wifiIP = await info.getWifiIP();

//   if (wifiIP == null) {
//     print('No Wi-Fi connected');
//     return printers;
//   }

//   final subnet = wifiIP.substring(0, wifiIP.lastIndexOf('.'));
//   final port = 9100;

//   for (int i = 1; i <= 254; i++) {
//     final ip = '$subnet.$i';
//     try {
//       final socket = await Socket.connect(ip, port,
//           timeout: Duration(milliseconds: 100));
//       socket.destroy();
//       printers.add(ip);
//     } catch (e) {
//       // Ignore failed connections
//     }
//   }

//   return printers;
// }

// Future<List<String>> discoverPrinters() async {
//   List<String> printers = [];
//   final port = 9100;

//   // Define the subnet you want to scan.
//   // Replace '192.168.1' with your actual subnet
//   final subnet = '192.168.1';

//   for (int i = 1; i <= 254; i++) {
//     final ip = '$subnet.$i';
//     try {
//       final socket =
//           await Socket.connect(ip, port, timeout: Duration(milliseconds: 50));
//       socket.destroy();
//       printers.add(ip);
//     } catch (e) {
//       // Ignore failed connections
//     }
//   }

//   return printers;
// }

// Future<List<String>> discoverPrinters() async {
//   List<String> printers = [];
//   final info = NetworkInfo();
//   final wifiIP = await info.getWifiIP();

//   if (wifiIP == null) {
//     print('No Wi-Fi connected');
//     return printers;
//   }

//   final subnet = wifiIP.substring(0, wifiIP.lastIndexOf('.'));
//   final port = 9100;

//   for (int i = 1; i <= 254; i++) {
//     final ip = '$subnet.$i';
//     try {
//       final socket =
//           await Socket.connect(ip, port, timeout: Duration(seconds: 1));
//       socket.destroy();
//       printers.add(ip);
//     } catch (e) {
//       // Log failed connections for debugging purposes
//       print('Failed to connect to $ip: $e');
//     }
//   }

//   if (printers.isEmpty) {
//     print('No printers found');
//   } else {
//     print('Discovered printers: $printers');
//   }

//   return printers;
// }

// Future<void> printReceipt() async {
//   print('Discovering printers...');

//   // Discover printers
//   List<String> printers = await discoverPrinters();
//   if (printers.isEmpty) {
//     print('No printers found');
//     return;
//   }

//   // Load the printer's capability profile
//   final profile = await CapabilityProfile.load(name: 'default');

//   // Create the generator
//   final generator = Generator(PaperSize.mm80, profile);

//   // Generate the receipt content
//   List<int> bytes = [];

//   // Add the store name
//   bytes += generator.text(
//     controller.createOrderData.cartproducts![0].cartId.toString(),
//     styles: PosStyles(align: PosAlign.center, bold: true),
//     linesAfter: 1,
//   );

//   // Add the store address
//   bytes += generator.text('123 Main ');
//   bytes += generator.text('City, Country');
//   bytes += generator.hr(); // Horizontal line

//   // Add the header for items
//   bytes += generator.text('Item                 Qty  Price');

//   // Add each item
//   for (var product in controller.createOrderData.cartproducts!) {
//     final name = product.name; // Replace with actual field name
//     final qty = product.quantity; // Replace with actual field name
//     final price = product.price; // Replace with actual field name
//     bytes += generator.text(
//       '$name                    $qty  \$${price?.toStringAsFixed(2)}',
//     );
//   }
//   bytes += generator.hr(); // Horizontal line

//   // Add the total
//   bytes += generator.text(
//     'Total: ${controller.createOrderData.amount.toString()}',
//     styles: PosStyles(align: PosAlign.right, bold: true),
//   );

//   // Feed some lines
//   bytes += generator.feed(2);

//   // Cut the paper
//   bytes += generator.cut();

//   // Print to the first discovered printer
//   await sendToNetworkPrinter(bytes, printers.first);
// }

// Future<void> sendToNetworkPrinter(List<int> bytes, String printerIp) async {
//   print('Sending data to printer: $printerIp');
//   final profile = await CapabilityProfile.load(name: 'default');
//   final printer = NetworkPrinter(PaperSize.mm80, profile);

//   final res = await printer.connect(printerIp, port: 9100);

//   if (res == PosPrintResult.success) {
//     printer.rawBytes(bytes);
//     printer.disconnect();
//   } else {
//     print('Could not connect to the printer');
//   }
// }

// Future<List<String>> discoverPrinters() async {
//   List<String> printers = [];
//   final info = NetworkInfo();
//   final wifiIP = await info.getWifiIP();

//   if (wifiIP == null) {
//     print('No Wi-Fi connected');
//     return printers;
//   }

//   final subnet = wifiIP.substring(0, wifiIP.lastIndexOf('.'));
//   final port = 9100;

//   for (int i = 1; i <= 254; i++) {
//     final ip = '$subnet.$i';
//     try {
//       final socket =
//           await Socket.connect(ip, port, timeout: Duration(seconds: 1));
//       socket.destroy();
//       printers.add(ip);
//     } catch (e) {
//       // Log failed connections for debugging purposes
//       print('Failed to connect to $ip: $e');
//     }
//   }

//   return printers;
// }

// Future<void> printReceipt() async {
//   print('Discovering printers...');

//   // Discover printers
//   List<String> printers = await discoverPrinters();
//   if (printers.isEmpty) {
//     print('No printers found');
//     return;
//   }

//   // Load the printer's capability profile
//   final profile = await CapabilityProfile.load(name: 'default');

//   // Create the generator
//   final generator = Generator(PaperSize.mm80, profile);

//   // Generate the receipt content
//   List<int> bytes = [];

//   // Add the store name
//   bytes += generator.text(
//     controller.createOrderData.cartproducts![0].cartId.toString(),
//     styles: PosStyles(align: PosAlign.center, bold: true),
//     linesAfter: 1,
//   );

//   // Add the store address
//   bytes += generator.text('123 Main ');
//   bytes += generator.text('City, Country');
//   bytes += generator.hr(); // Horizontal line

//   // Add the header for items
//   bytes += generator.text('Item                 Qty  Price');

//   // Add each item
//   for (var product in controller.createOrderData.cartproducts!) {
//     final name = product.name; // Replace with actual field name
//     final qty = product.quantity; // Replace with actual field name
//     final price = product.price; // Replace with actual field name
//     bytes += generator.text(
//       '$name                    $qty  \$${price?.toStringAsFixed(2)}',
//     );
//   }
//   bytes += generator.hr(); // Horizontal line

//   // Add the total
//   bytes += generator.text(
//     'Total: ${controller.createOrderData.amount.toString()}',
//     styles: PosStyles(align: PosAlign.right, bold: true),
//   );

//   // Feed some lines
//   bytes += generator.feed(2);

//   // Cut the paper
//   bytes += generator.cut();

//   // Print to the first discovered printer
//   await sendToNetworkPrinter(bytes, printers.first);
// }

// Future<void> sendToNetworkPrinter(List<int> bytes, String printerIp) async {
//   print('Sending data to printer: $printerIp');
//   final profile = await CapabilityProfile.load(name: 'default');
//   final printer = NetworkPrinter(PaperSize.mm80, profile);

//   final res = await printer.connect(printerIp, port: 9100);

//   if (res == PosPrintResult.success) {
//     printer.rawBytes(bytes);
//     printer.disconnect();
//   } else {
//     print('Could not connect to the printer');
//   }
// }

// Future<List<String>> discoverPrinters() async {
//   List<String> printers = [];
//   final info = NetworkInfo();
//   final wifiIP = await info.getWifiIP();

//   if (wifiIP == null) {
//     print('No Wi-Fi connected');
//     return printers;
//   }

//   final subnet = wifiIP.substring(0, wifiIP.lastIndexOf('.'));
//   final port = 9100;

//   for (int i = 1; i <= 254; i++) {
//     final ip = '$subnet.$i';
//     try {
//       final socket =
//           await Socket.connect(ip, port, timeout: Duration(seconds: 1));
//       socket.destroy();
//       printers.add(ip);
//     } catch (e) {
//       // Ignore failed connections
//     }
//   }

//   return printers;
// }

// Future<void> printReceipt() async {
//   print('muthuvel');

//   // Discover printers
//   List<String> printers = await discoverPrinters();
//   if (printers.isEmpty) {
//     print('No printers found');
//     return;
//   }

//   // Load the printer's capability profile
//   final profile = await CapabilityProfile.load(name: 'default');

//   // Create the generator
//   final generator = Generator(PaperSize.mm80, profile);

//   // Generate the receipt content
//   List<int> bytes = [];

//   // Add the store name
//   bytes += generator.text(
//     controller.createOrderData.cartproducts![0].cartId.toString(),
//     styles: PosStyles(align: PosAlign.center, bold: true),
//     linesAfter: 1,
//   );

//   // Add the store address
//   bytes += generator.text('123 Main ');
//   bytes += generator.text('City, Country');
//   bytes += generator.hr(); // Horizontal line

//   // Add the header for items
//   bytes += generator.text('Item                 Qty  Price');

//   // Add each item
//   for (var product in controller.createOrderData.cartproducts!) {
//     final name = product.name; // Replace with actual field name
//     final qty = product.quantity; // Replace with actual field name
//     final price = product.price; // Replace with actual field name
//     bytes += generator.text(
//       '$name                    $qty  \$${price?.toStringAsFixed(2)}',
//     );
//   }
//   bytes += generator.hr(); // Horizontal line

//   // Add the total
//   bytes += generator.text(
//     'Total: ${controller.createOrderData.amount.toString()}',
//     styles: PosStyles(align: PosAlign.right, bold: true),
//   );

//   // Feed some lines
//   bytes += generator.feed(2);

//   // Cut the paper
//   bytes += generator.cut();

//   // Print to the first discovered printer
//   await sendToNetworkPrinter(bytes, printers.first);
// }

// Future<void> sendToNetworkPrinter(List<int> bytes, String printerIp) async {
//   print('muthu print');
//   final profile = await CapabilityProfile.load(name: 'default');
//   final printer = NetworkPrinter(PaperSize.mm80, profile);

//   final res = await printer.connect(printerIp, port: 9100);

//   if (res == PosPrintResult.success) {
//     printer.rawBytes(bytes);
//     printer.disconnect();
//   } else {
//     print('Could not connect to the printer');
//   }
// }

// class PrinterDiscovery {
//   // Modify this method to directly scan a common subnet
//   Future<List<String>> discoverPrinters() async {
//     List<String> printers = [];
//     // Define the subnet you want to scan
//     final subnet = '192.168.1'; // Example subnet, you can adjust as needed
//     final port = 9100;

//     for (int i = 1; i <= 254; i++) {
//       final ip = '$subnet.$i';
//       try {
//         final socket = await Socket.connect(ip, port,
//             timeout: Duration(milliseconds: 100));
//         socket.destroy();
//         printers.add(ip);
//       } catch (e) {
//         // Ignore failed connections
//       }
//     }

//     return printers;
//   }

//   Future<void> printReceipt() async {
//     print('Printing receipt...');

//     // Discover printers
//     List<String> printers = await discoverPrinters();
//     if (printers.isEmpty) {
//       print('No printers found');
//       return;
//     }

//     // Load the printer's capability profile
//     final profile = await CapabilityProfile.load(name: 'default');

//     // Create the generator
//     final generator = Generator(PaperSize.mm80, profile);

//     // Generate the receipt content
//     List<int> bytes = [];

//     // Add the store name
//     bytes += generator.text(
//       'Store Name',
//       styles: PosStyles(align: PosAlign.center, bold: true),
//       linesAfter: 1,
//     );

//     // Add the store address
//     bytes += generator.text('123 Main St');
//     bytes += generator.text('City, Country');
//     bytes += generator.hr(); // Horizontal line

//     // Add the header for items
//     bytes += generator.text('Item                Qty  Price');

//     // Add example items
//     bytes += generator.text('Product 1           2    \$20.00');
//     bytes += generator.text('Product 2           1    \$10.00');
//     bytes += generator.hr(); // Horizontal line

//     // Add the total
//     bytes += generator.text(
//       'Total: \$30.00',
//       styles: PosStyles(align: PosAlign.right, bold: true),
//     );

//     // Feed some lines
//     bytes += generator.feed(2);

//     // Cut the paper
//     bytes += generator.cut();

//     // Print to the first discovered printer
//     await sendToNetworkPrinter(bytes, printers.first);
//   }

//   Future<void> sendToNetworkPrinter(List<int> bytes, String printerIp) async {
//     print('Connecting to printer...');
//     final profile = await CapabilityProfile.load(name: 'default');
//     final printer = NetworkPrinter(PaperSize.mm80, profile);

//     final res = await printer.connect(printerIp, port: 9100);

//     if (res == PosPrintResult.success) {
//       printer.rawBytes(bytes);
//       printer.disconnect();
//     } else {
//       print('Could not connect to the printer');
//     }
//   }
// }

class NetworkPrinter {
  NetworkPrinter(this._paperSize, this._profile, {int spaceBetweenRows = 5}) {
    _generator =
        Generator(paperSize, profile, spaceBetweenRows: spaceBetweenRows);
  }

  final PaperSize _paperSize;
  final CapabilityProfile _profile;
  String? _host;
  int? _port;
  late Generator _generator;
  late Socket _socket;

  int? get port => _port;
  String? get host => _host;
  PaperSize get paperSize => _paperSize;
  CapabilityProfile get profile => _profile;

  Future<PosPrintResult> connect(String host,
      {int port = 91000, Duration timeout = const Duration(seconds: 5)}) async {
    _host = host;
    _port = port;
    try {
      _socket = await Socket.connect(host, port, timeout: timeout);
      _socket.add(_generator.reset());
      return Future<PosPrintResult>.value(PosPrintResult.success);
    } catch (e) {
      return Future<PosPrintResult>.value(PosPrintResult.timeout);
    }
  }

  /// [delayMs]: milliseconds to wait after destroying the socket
  void disconnect({int? delayMs}) async {
    _socket.destroy();
    if (delayMs != null) {
      await Future.delayed(Duration(milliseconds: delayMs), () => null);
    }
  }

  // ************************ Printer Commands ************************
  void reset() {
    _socket.add(_generator.reset());
  }

  void text(
    String text, {
    PosStyles styles = const PosStyles(),
    int linesAfter = 0,
    bool containsChinese = false,
    int? maxCharsPerLine,
  }) {
    _socket.add(_generator.text(text,
        styles: styles,
        linesAfter: linesAfter,
        containsChinese: containsChinese,
        maxCharsPerLine: maxCharsPerLine));
  }

  void setGlobalCodeTable(String codeTable) {
    _socket.add(_generator.setGlobalCodeTable(codeTable));
  }

  void setGlobalFont(PosFontType font, {int? maxCharsPerLine}) {
    _socket
        .add(_generator.setGlobalFont(font, maxCharsPerLine: maxCharsPerLine));
  }

  void setStyles(PosStyles styles, {bool isKanji = false}) {
    _socket.add(_generator.setStyles(styles, isKanji: isKanji));
  }

  void rawBytes(List<int> cmd, {bool isKanji = false}) {
    _socket.add(_generator.rawBytes(cmd, isKanji: isKanji));
  }

  void emptyLines(int n) {
    _socket.add(_generator.emptyLines(n));
  }

  void feed(int n) {
    _socket.add(_generator.feed(n));
  }

  void cut({PosCutMode mode = PosCutMode.full}) {
    _socket.add(_generator.cut(mode: mode));
  }

  void printCodeTable({String? codeTable}) {
    _socket.add(_generator.printCodeTable(codeTable: codeTable));
  }

  void beep({int n = 3, PosBeepDuration duration = PosBeepDuration.beep450ms}) {
    _socket.add(_generator.beep(n: n, duration: duration));
  }

  void reverseFeed(int n) {
    _socket.add(_generator.reverseFeed(n));
  }

  void row(List<PosColumn> cols) {
    _socket.add(_generator.row(cols));
  }

  void barcode(
    Barcode barcode, {
    int? width,
    int? height,
    BarcodeFont? font,
    BarcodeText textPos = BarcodeText.below,
    PosAlign align = PosAlign.center,
  }) {
    _socket.add(_generator.barcode(
      barcode,
      width: width,
      height: height,
      font: font,
      textPos: textPos,
      align: align,
    ));
  }

  void qrcode(
    String text, {
    PosAlign align = PosAlign.center,
    QRSize size = QRSize.size4,
    QRCorrection cor = QRCorrection.L,
  }) {
    _socket.add(_generator.qrcode(text, align: align, size: size, cor: cor));
  }

  void drawer({PosDrawer pin = PosDrawer.pin2}) {
    _socket.add(_generator.drawer(pin: pin));
  }

  void hr({String ch = '-', int? len, int linesAfter = 0}) {
    _socket.add(_generator.hr(ch: ch, linesAfter: linesAfter));
  }

  void textEncoded(
    Uint8List textBytes, {
    PosStyles styles = const PosStyles(),
    int linesAfter = 0,
    int? maxCharsPerLine,
  }) {
    _socket.add(_generator.textEncoded(
      textBytes,
      styles: styles,
      linesAfter: linesAfter,
      maxCharsPerLine: maxCharsPerLine,
    ));
  }
}

class PosPrintResult {
  const PosPrintResult._internal(this.value);
  final int value;
  static const success = PosPrintResult._internal(1);
  static const timeout = PosPrintResult._internal(2);
  static const printerNotSelected = PosPrintResult._internal(3);
  static const ticketEmpty = PosPrintResult._internal(4);
  static const printInProgress = PosPrintResult._internal(5);
  static const scanInProgress = PosPrintResult._internal(6);

  String get msg {
    if (value == PosPrintResult.success.value) {
      return 'Success';
    } else if (value == PosPrintResult.timeout.value) {
      return 'Error. Printer connection timeout';
    } else if (value == PosPrintResult.printerNotSelected.value) {
      return 'Error. Printer not selected';
    } else if (value == PosPrintResult.ticketEmpty.value) {
      return 'Error. Ticket is empty';
    } else if (value == PosPrintResult.printInProgress.value) {
      return 'Error. Another print in progress';
    } else if (value == PosPrintResult.scanInProgress.value) {
      return 'Error. Printer scanning in progress';
    } else {
      return 'Unknown error';
    }
  }
}
