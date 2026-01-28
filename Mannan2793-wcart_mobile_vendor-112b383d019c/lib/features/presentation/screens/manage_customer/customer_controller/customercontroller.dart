import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/removecustomer_model.dart';
import 'package:wcart_vendor/model/viewcustomer_model.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:http/http.dart' as http;

class CustomerController extends GetxController with StateMixin {
  ViewCustomerModel viewCustomerData = ViewCustomerModel();
  RemoveCustomerModel removeCustomerData = RemoveCustomerModel();

  TextEditingController customerGroup = TextEditingController();
  TextEditingController priceGroup = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController vatNumber = TextEditingController();
  TextEditingController gstNumber = TextEditingController();
  TextEditingController company = TextEditingController();

  FilePickerResult? result;
  File? imageFile;
  String? imageUrl;
  @override
  void onInit() {
    print('-------Muthu12345-----');
    viewCustomer();
    super.onInit();
  }

  viewCustomer() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.manageCustomer, body: {
      "vendorid": Singleton.instance.vendorId,
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      print(value);
      if (value['status']) {
        viewCustomerData = ViewCustomerModel.fromJson(value['data']);
        print("muthuvel");
      } else {
        print('error');
      }
    });
    change(viewCustomerData, status: RxStatus.success());
  }

  removeCustomer({
    required String userId,
  }) async {
    print(Singleton.instance.vendorId);
    print(userId);
    // change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.removeCustomer, body: {
      'vendorid': Singleton.instance.vendorId,
      'servicekey': Singleton.instance.serviceKey,
      // "cart_from": "3",
      "userid": userId,
    }).then((value) {
      print(value);
      if (value['status']) {
        viewCustomer();
        // Get.snackbar('Message', value['data']['message'],
        //     snackPosition: SnackPosition.TOP);
      } else {
        print('error');
      }
    });
    change(viewCustomerData, status: RxStatus.success());
  }

  Future<dynamic> addCustomer() async {
    try {
      // Create multipart request for POST method
      var request = http.MultipartRequest(
        "POST",
        Uri.parse('https://wcartnode.webnexs.org/vendorapi/add_customer'),
      );

      // Ensure that Singleton.instance.vendorId and Singleton.instance.serviceKey are not null
      String vendorId =
          Singleton.instance.vendorId ?? Get.arguments['vendoreID'];
      String serviceKey =
          Singleton.instance.serviceKey ?? Get.arguments['servicekey'];

      // Add fields to the request
      request.fields["vendorid"] = vendorId;
      request.fields["servicekey"] = serviceKey;
      request.fields["name"] = name.text;
      request.fields["emailid"] = email.text;
      request.fields["country_code"] = '+91';
      request.fields["phone"] = mobile.text;
      request.fields["password"] = "";

      // If imageFile is not null, add it to the request
      // if (imageFile != null) {
      //   var pic = await http.MultipartFile.fromPath(
      //     "image",
      //     imageFile!.path,
      //     contentType: MediaType('image', 'jpeg'),
      //     filename: imageFile!.path.split('/').last,
      //   );
      //   request.files.add(pic);
      // }

      // Send the request
      var response = await request.send();

      // Get the response from the server
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print(responseString);
      var responseJson = jsonDecode(responseString);

      // Extract the status field from the response
      String message = responseJson['status'] ??
          'true'; // Default to 'false' if status is not available

      // Print the message (optional)
      print(message);

      if (response.statusCode == 200 && message.toLowerCase() == 'true') {
        email.clear();
        name.clear();
        mobile.clear();

        Get.back(result: true);

        // Show success snackbar
        showSuccessSnackBar(
          
          'Customer added successfully!',
          
        );
      } else {
        // Show error snackbar
        showInfoSnackBar(
          
          'Mobile Number OR Email ID Already Register!!!!',
          
        );
      }
    } catch (e) {
      // Show error snackbar for unexpected errors
      showInfoSnackBar(
        
        'An unexpected error occurred: $e',
        
      );
    }
  }
}
