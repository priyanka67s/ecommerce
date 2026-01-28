import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_pos_printer_platform_image_3/flutter_pos_printer_platform_image_3.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/getx_repository.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/allstaffs_model.dart';
import 'package:wcart_vendor/model/claim-reward_model.dart';
import 'package:wcart_vendor/model/posordercreate_model.dart';
import 'package:wcart_vendor/model/view_pincode_model.dart';
import 'package:wcart_vendor/model/viewpincode_model.dart';
import 'package:wcart_vendor/router.dart';
// import 'package:wcart_vendor/screens/pos_method/payment_pos/payment_succes.dart';
import 'package:wcart_vendor/singleton.dart';

class PaymentController extends GetxController with StateMixin {
  PosCreateOrderModel createOrderData = PosCreateOrderModel();
  TextEditingController saleNoteController = TextEditingController();
  TextEditingController staffNoteController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController paymentNoteController = TextEditingController();
  RewardPointClaimedModel rewardPointsClaimData = RewardPointClaimedModel();
  ViewZipCodeModel zipCodeData = ViewZipCodeModel();

  //! Address Page Input Fields
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var devices = [];
  ApiClient apiClient = ApiClient();

  var brandDropDownValue;

  // List<String> locationStatusValueList = [
  //   'Cash',
  //   'Credit Card',
  //   'UPI Payment',
  //   'Other'
  // ];
  final Map<String, int> locationStatusMap = {
    'Cash': 1,
    'Credit Card': 2,
    'UPI Payment': 2,
    'Other': 3,
  };

  // List<String> locationStatusValueList = locationStatusMap.keys.toList();
  AllStaffsModel allStaffData = AllStaffsModel();
  String? locationSelectedStatusValueList;
  String? paymentType;
  String? selectedTerritory;
  int? territoryId;

  String deliveryType = "pickup";
  String paymentOption = "cash";
  String? warehouseId;
  String? customerId;
  String? assignedLocationId;

  @override
  void onInit() {
    allStaff();
    debugPrint(Get.arguments['assigned_location_id'].toString());
    assignedLocationId = Get.arguments['assigned_location_id'].toString();
    scanForPrinters(PrinterType.usb);
    warehouseId = Get.arguments['warehouseId'];
    customerId = Get.arguments['userId'];
    super.onInit();
  }

  Future<void> sendBytesToPrint(List<int> bytes, PrinterType type) async {
    print('muthuvel new');
    await PrinterManager.instance.send(type: type, bytes: bytes);
  }

  // Connect to a selected printer device
  Future<void> connectDevice(
    PrinterDevice selectedPrinter,
    PrinterType type, {
    bool reconnect = false,
    bool isBle = false,
    String? ipAddress,
  }) async {
    switch (type) {
      // Only Windows and Android
      case PrinterType.usb:
        await PrinterManager.instance.connect(
          type: type,
          model: UsbPrinterInput(
            name: selectedPrinter.name,
            productId: selectedPrinter.productId,
            vendorId: selectedPrinter.vendorId,
          ),
        );
        break;
      // Only iOS and Android
      case PrinterType.bluetooth:
        await PrinterManager.instance.connect(
          type: type,
          model: BluetoothPrinterInput(
            name: selectedPrinter.name,
            address: selectedPrinter.address!,
            isBle: isBle,
            autoConnect: reconnect,
          ),
        );
        break;

      // Network printers
      case PrinterType.network:
        await PrinterManager.instance.connect(
          type: type,
          model: TcpPrinterInput(
            ipAddress: ipAddress ?? selectedPrinter.address!,
          ),
        );
        break;
      default:
        throw UnsupportedError('Unsupported printer type: $type');
    }
  }

  void scanForPrinters(PrinterType type, {bool isBle = false}) {
    print('Scanning for printers of type: $type');
    PrinterManager.instance.discovery(type: type, isBle: isBle).listen(
        (device) {
      print("Discovered device: ${device.name}");
      // Add the discovered device to a list
      devices.add(device); // Ensure you have a list called 'devices'
    }, onError: (error) {
      print("Error during discovery: $error");
    }, onDone: () {
      print("Discovery process completed.");
    });
  }

  // Scan for available printers
  // void scan(PrinterType type, {bool isBle = false}) {
  //   print('muthuvel new2');
  //   PrinterManager.instance
  //       .discovery(type: type, isBle: isBle)
  //       .listen((device) {
  //     print("Found device: ${device.name}");
  //     devices.add(device);
  //   });
  // }

  // connectDevice(PrinterDevice selectedPrinter, PrinterType type,
  //     {bool reconnect = false,
  //     bool isBle = false,
  //     String? ipAddress = null}) async {
  //   switch (type) {
  //     // only windows and android
  //     case PrinterType.usb:
  //       await PrinterManager.instance.connect(
  //           type: type,
  //           model: UsbPrinterInput(
  //             name: selectedPrinter.name,
  //             productId: selectedPrinter.productId,
  //             vendorId: selectedPrinter.vendorId,
  //           ));
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

  // scan(PrinterType type, {bool isBle = false}) {
  //   // Find printers
  //   PrinterManager.instance
  //       .discovery(type: type, isBle: isBle)
  //       .listen((device) {
  //     print("======== > ${device}");
  //     devices.add(device);
  //   });
  // }

  allStaff() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.viewVendorStaff, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "store_staff_id": ''
    }).then((value) {
      print(value);
      if (value['status']) {
        allStaffData = AllStaffsModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(allStaffData, status: RxStatus.success());
  }

  createOrder({required String userId}) async {
    print(Singleton.instance.storeStaffId);
    print('muthu');
    print(Singleton.instance.serviceKey ?? "");

    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.createorder, body: {
      'vendorid': Singleton.instance.vendorId ?? "",
      'servicekey': Singleton.instance.serviceKey ?? "",
      "store_staff_id": '0',
      "assigned_location_id": assignedLocationId ?? '',
      "cart_from": "2",
      "user_id": userId,
      "warehouse_id": warehouseId ?? '',
      "name": nameController.text,
      "addressline1": addressController.text,
      "addressline2": '',
      "city": cityController.text,
      "district": cityController.text,
      "state": stateController.text,
      "country": countryController.text,
      "pincode": zipCodeController.text,
      "email": "",
      "country_code": "IN",
      "phone": phoneController.text,
      "landmark": "",
      "paymentmethod": paymentType,
      "delivery_type": deliveryType.toString(),
      "store_currency": 'INR',
      "assigned_by": Singleton.instance.vendorId ?? "",
      "assigned_to": "2",
      "assigned_for": "2",
      "currency_code": 'INR',
      "tax": '',
      "tax_percentage": '',
      "tax_name": '',
      "biller_id": '',
      "biller_sale_note": saleNoteController.text,
      "biller_staff_note": staffNoteController.text,
      "biller_payment_note": paymentNoteController.text,
      "user_session_id": "0",
    }).then((value) {
      print(deliveryType);
      print(value);
      if (value['status']) {
        print("-------------------");
        showSuccessSnackBar(          
          value['data']['message'],          
        );
        createOrderData = PosCreateOrderModel.fromJson(value['data']);
        Get.toNamed(Routes.paymentSuccessPage);
        // Navigator.pop(context);
        //                       Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                           builder: (context) => PaymentSuccessScreen(),
        //                         ),
        //                       );
      } else {
        print('error');
      }
    });
    change(createOrderData, status: RxStatus.success());
  }

  Future<void> claimReward() async {
    print('Mycart');
    change(null, status: RxStatus.loading());
    try {
      Response getResponse = await apiClient.post(HttpUrl.rewardClaim, {
        "user_id": Singleton.instance.userId,
        "device_type": 'mobile',
        'country_code': '',
        "state_code": '',
        "city_code": '',
        "postal_code": '600001',
      }, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'servicekey': 'by_pass_token'
      });
      print(getResponse.bodyString);
      rewardPointsClaimData = RewardPointClaimedModel.fromJson(
        jsonDecode(getResponse.bodyString!) as Map<String, dynamic>,
      );
      print('-------mycart----------');
      print(rewardPointsClaimData);
      print(rewardPointsClaimData.message);
    } catch (e) {
      print('======= > $e');
    }
    change(rewardPointsClaimData, status: RxStatus.success());
  }

  //! fetch zipCode Data
  Future<void> fetchZipCodeData({required String pincode}) async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.viewPinCode,
        body: {'pincode': pincode ?? ''}).then((value) {
      if (value['status']) {
        zipCodeData = ViewZipCodeModel.fromJson(value['data']);
        cityController.text = zipCodeData.filteredCity!.cityName ?? '';
        stateController.text = zipCodeData.filteredState!.stateName ?? '';
        countryController.text = zipCodeData.filteredCountry!.countryName ?? '';
        change([cityController, stateController, countryController],
            status: RxStatus.success());
      } else {
        print('error');
      }
    });
    change(zipCodeData, status: RxStatus.success());
  }
}
