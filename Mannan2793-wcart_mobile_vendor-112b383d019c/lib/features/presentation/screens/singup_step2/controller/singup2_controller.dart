import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:http_parser/http_parser.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/getx_repository.dart';

import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/vendorform_model.dart';
import 'package:wcart_vendor/singleton.dart';

class SignUp2Controller extends GetxController with StateMixin {
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController registerNumberController =
      TextEditingController();
  final TextEditingController businessTypeController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController vatNumberController = TextEditingController();
  final TextEditingController gstNumberController = TextEditingController();
  final TextEditingController accountHolderController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController bankBranchController = TextEditingController();
  final TextEditingController bankCountryController = TextEditingController();
  final TextEditingController swiftCodeController = TextEditingController();
  final TextEditingController uploadGstController = TextEditingController();
  final TextEditingController panNumberController = TextEditingController();
  final TextEditingController textFiledController = TextEditingController();

  bool isFileUploaded = false;

  // Here create the instance for HTTP access
  ApiClient apiClient = ApiClient();
  // Here we instance the Verify signup model
  // Signup2 Signup2Data = Signup2();
  VendorFormFieldModel formFiledData = VendorFormFieldModel();
  FilePickerResult? result;
  File? imageFile;

  List<String> statusValue = ['Personal', 'Register'];

  String value2 = "Personal";

  @override
  void onInit() {
    change(null, status: RxStatus.loading());

    super.onInit();
    vendorFormField();
    // signUp();
    change(null, status: RxStatus.success());
  }

  getImage() async {
    result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      PlatformFile? file = result?.files.first;

      imageFile = File(file?.path ?? '');

      change(imageFile);
    } else {
      // User canceled the picker
      showFailureSnackBar('Image not selected');
    }
  }

  Future<bool> signup2() async {
    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse('https://wcartnode.webnexs.org/vendorapi/register_step2'),
      );
      print(Singleton.instance.vendorId);
      request.fields["vendorid"] =
          Singleton.instance.vendorId ?? Get.arguments['vendoreID'];
      request.fields["servicekey"] =
          Singleton.instance.serviceKey ?? Get.arguments['servicekey'];
      request.fields["brandname"] = brandNameController.text;
      request.fields["brandslug"] = '';
      request.fields["status"] = '1';
      request.fields["businesstype"] = statusValue.toString();
      request.fields["id"] =
          Singleton.instance.userId ?? Get.arguments['userId'];
      request.fields["abourbrand"] = aboutController.text;
      request.fields["registernumber"] = registerNumberController.text;
      request.fields["website"] = websiteController.text;
      request.fields["vatnumber"] = vatNumberController.text;
      request.fields["gstnumber"] = gstNumberController.text;
      request.fields["accountholder"] = accountHolderController.text;
      request.fields["accountnumber"] = accountNumberController.text;
      request.fields["bankname"] = bankNameController.text;
      request.fields["bankbranch"] = bankBranchController.text;
      request.fields["bankcountry"] = bankCountryController.text;
      request.fields["swiftcode"] = swiftCodeController.text;

      if (formFiledData.additionalFields != null) {
        for (var data in formFiledData.additionalFields!) {
          if (data.formFieldType == 1 ||
              data.formFieldType == 2 ||
              data.formFieldType == 3) {
            request.fields
                .addAll({data.formFieldSlug!: data.textController?.text ?? ''});
          }
        }
      }

      var pic = await http.MultipartFile.fromPath(
        "brandlogo",
        imageFile!.path,
        contentType: MediaType('image', 'jpeg'),
        filename: imageFile!.path.split('/').last,
      );

      request.files.add(pic);
      var response = await request.send();

      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print(responseString);

      if (response.statusCode == 200) {
        var data = jsonDecode(responseString);
        showSuccessSnackBar(data['message']);
        return true;
      } else {
        showInfoSnackBar('Failed to sign up');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      showFailureSnackBar('Failed to sign up');
      return false;
    }
  }

  // Future<void> vendorFormField() async {
  //   try {
  //     change(null, status: RxStatus.loading());
  //     var response = await HttpClint.get(HttpUrl.vendoreFormFiled);
  //     print("----------------");
  //     print(response);
  //     if (response['status']) {
  //       formFiledData = VendorFormFieldModel.fromJson(response['data']);
  //       print(formFiledData);
  //     } else {
  //       print('error');
  //     }
  //     change(formFiledData, status: RxStatus.success());
  //   } catch (e) {
  //     print('Error: $e');
  //     change(null, status: RxStatus.error('Failed to load form fields'));
  //   }
  // }

  // Future<void> vendorFormField() async {
  //   try {
  //     change(null, status: RxStatus.loading());
  //     var response = await http.get(
  //       Uri.parse(HttpUrl.vendoreFormFiled),
  //       headers: {
  //         'servicekey': 'by_pass_token',
  //       },
  //     );
  //     print("----------------");
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       var responseData = json.decode(response.body);
  //       if (responseData['status'].toLowerCase() == 'true') {
  //         formFiledData = VendorFormFieldModel.fromJson(responseData['data']);
  //         print(formFiledData);
  //       } else {
  //         print('error');
  //       }
  //       change(formFiledData, status: RxStatus.success());
  //     } else {
  //       print('error');
  //       change(null, status: RxStatus.error('Failed to load form fields'));
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     change(null, status: RxStatus.error('Failed to load form fields'));
  //   }
  // }

  Future<void> vendorFormField() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await http.get(
        Uri.parse(HttpUrl.vendoreFormFiled),
        headers: {
          'servicekey': 'by_pass_token',
        },
      );
      print("----------------");
      print(response.body);
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        var status = responseData['status'];
        if (status != null && status.toLowerCase() == 'true') {
          var data = responseData['data'];
          if (data != null) {
            formFiledData = VendorFormFieldModel.fromJson(data);
            print(formFiledData);
          } else {
            print('Data is null');
          }
        } else {
          print('Status is not true');
        }
        change(formFiledData, status: RxStatus.success());
      } else {
        print('HTTP request failed with status: ${response.statusCode}');
        change(null, status: RxStatus.error('Failed to load form fields'));
      }
    } catch (e) {
      print('Error: $e');
      change(null, status: RxStatus.error('Failed to load form fields'));
    }
  }

  Future<dynamic> uploadFile() async {
    await FilePicker.platform
        .pickFiles(type: FileType.image)
        .then((pickedImage) async {
      if (pickedImage != null) {
        PlatformFile? file = pickedImage.files.first;
        var receivedFile = File(file.path ?? '');
        var request = http.MultipartRequest("POST",
            Uri.parse('https://wcartnode.webnexs.org/vendorapi/add_image'));
        var uploadFile = await http.MultipartFile.fromPath(
            "addfield", receivedFile.path,
            contentType: MediaType('image', 'jpeg'),
            filename: receivedFile.path.split('/').last);

        request.fields["Content-Type"] = receivedFile.path.split('/').last;
        request.files.add(uploadFile);
        var response = await request.send();
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);

        if (response.statusCode == 200) {
          var data = jsonDecode(responseString);
          change(isFileUploaded = true);
          showSuccessSnackBar(data['message']);
        }
      }
    });
  }
}
