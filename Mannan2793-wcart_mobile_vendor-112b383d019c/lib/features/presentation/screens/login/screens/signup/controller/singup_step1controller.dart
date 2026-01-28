import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/getx_repository.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/singupcustomefileds_model.dart';
import 'package:wcart_vendor/model/singupstep1_model.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:wcart_vendor/util/constants.dart';
import 'package:wcart_vendor/util/preference_helper.dart';

class SignUpController extends GetxController with StateMixin {
  String name = 'muthuvel';
  var textControllers = <String, TextEditingController>{}.obs;

  Map<String, TextEditingController> textControllerMap = {};

  StepOneCustomeFiledsModel customeFileds = StepOneCustomeFiledsModel();

  ApiClient apiClient = ApiClient();

  SignUp1 signUp1Data = SignUp1();
  bool isFileUploaded = false;

  FilePickerResult? result;
  File? imageFile;

  @override
  void onInit() {
    change(null, status: RxStatus.loading());

    super.onInit();
    fetchVendorFields();

    change(null, status: RxStatus.success());
  }


  int currentIndex = 0;

  void updateIndex(int index) {
    currentIndex = index;
    update(); // Notifies UI to rebuild
  }

  List<String> steps = [
    'Basic Details',
    'Address Details',
    'Store Details',
    'Bank Details'
  ];

  void submitSignUp() {
    // Submit logic
  }


  Future<void> fetchVendorFields() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await HttpClint.get(HttpUrl.stepOneCustomFiled);
      print("----------------");
      print(response);
      if (response['status']) {
        debugPrint('CUSTOM FIELDS$customeFileds');
        customeFileds = StepOneCustomeFiledsModel.fromJson(response['data']);        
        for (var field in customeFileds.additionalfrom!) {
          String fieldName = field.formFieldName!;
          textControllers[fieldName] = TextEditingController();
          if (fieldName == 'password') {
            textControllers['confirmPassword'] = TextEditingController();
          }
        }        
      } else {
        print('error');
      }
      change(customeFileds, status: RxStatus.success());
    } catch (e) {
      print('Error: $e');
      change(null, status: RxStatus.error('Failed to load form fields'));
    }
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

  Future<dynamic> uploadFile() async {
    await FilePicker.platform
        .pickFiles(type: FileType.image)
        .then((pickedImage) async {
      if (pickedImage != null) {
        PlatformFile? file = pickedImage.files.first;
        var receivedFile = File(file.path ?? '');
        var request = http.MultipartRequest(
            "POST",
            Uri.parse(
                'https://wcartnode.webnexs.org/vendorapi/vendorRegistration_image_upload'));
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
Future<bool> signUp() async {
  // Indicate loading state
  change(null, status: RxStatus.loading());    
  bool loginSuccess = false;

  try {
    debugPrint(jsonEncode({
         "name": textControllers['name']?.text ?? '',
        "last_name": textControllers['last_name']?.text ?? '',
        "emailid": textControllers['email_id']?.text ?? '',
        "password": textControllers['password']?.text ?? '',
        "country_code": "+91",        
        "phone": textControllers['phone']?.text ?? '',
        "address": textControllers['address']?.text ?? '',        
        "city": textControllers['city']?.text ?? '',
        "state": textControllers['state']?.text ?? '',
        "country": textControllers['country']?.text ?? '',
        "pincode": textControllers['pincode']?.text ?? '',
        "brandname":textControllers['brandname']?.text ?? '',
        "businesstype":"0",
        "website":textControllers['website']?.text ?? '',
        "brandlogo":"logo",
        "storebanner":"banner",
        "registernumber":textControllers['registernumber']?.text ?? '',
        "gstnumber":textControllers['gstnumber']?.text ?? '',
        "accountholder":textControllers['accountholder']?.text ?? '',
        "accountnumber":textControllers['accountnumber']?.text ?? '',
        "bankname":textControllers['bankname']?.text ?? '',
        "bankbranch":textControllers['bankbranch']?.text ?? '',
        "bankcountry":textControllers['bankcountry']?.text ?? '',
        "swiftcode":""
    }));

    await HttpClint.urlEncoded(HttpUrl.register, body: {
         "name": textControllers['name']?.text ?? '',
        "last_name": textControllers['last_name']?.text ?? '',
        "emailid": textControllers['email_id']?.text ?? '',
        "password": textControllers['password']?.text ?? '',
        "country_code": "+91",        
        "phone": textControllers['phone']?.text ?? '',
        "address": textControllers['address']?.text ?? '',        
        "city": textControllers['city']?.text ?? '',
        "state": textControllers['state']?.text ?? '',
        "country": textControllers['country']?.text ?? '',
        "pincode": textControllers['pincode']?.text ?? '',
        "brandname":textControllers['brandname']?.text ?? '',
        "businesstype":"0",
        "website":textControllers['website']?.text ?? '',
        "brandlogo":"logo",
        "storebanner":"banner",
        "registernumber":textControllers['registernumber']?.text ?? '',
        "gstnumber":textControllers['gstnumber']?.text ?? '',
        "accountholder":textControllers['accountholder']?.text ?? '',
        "accountnumber":textControllers['accountnumber']?.text ?? '',
        "bankname":textControllers['bankname']?.text ?? '',
        "bankbranch":textControllers['bankbranch']?.text ?? '',
        "bankcountry":textControllers['bankcountry']?.text ?? '',
        "swiftcode":""
    }).then((value) {
      print('{allcatergorei---------------------------} ${value['data']}');
      // print(value);
      if (value['status']) {
        debugPrint('CUSTOM FIELDS$customeFileds');              

      if (value['status'] == true) {
        print("Login Successful");

              //  PreferenceHelper.setString(
              //       Constants.vendorId, value['data']['vendorDetails']['vendorid'].toString());
              //   PreferenceHelper.setString(Constants.servicekey,
              //       value['data']['vendorDetails']['servicekey'].toString());
              //   // Set login status to true
              //   PreferenceHelper.setBool(Constants.loginStatus, true);
              //   print(value['data']['vendorDetails']['vendorid'].toString());
              //   print(Constants.servicekey);

              //   // Update Singleton instance with vendor details
              //   Singleton.instance.vendorId =
              //       value['data']['vendorDetails']['vendorid'].toString();
              //   Singleton.instance.serviceKey =
              //       value['data']['vendorDetails']['servicekey'].toString();
              //   Singleton.instance.serviceKey =
              //       value['data']['vendorDetails']['servicekey'].toString();
              //   Singleton.instance.storeStaffId = value['data']['vendorDetails']['store_staff_id'].toString();
              showSuccessSnackBar(value['message'] ??
                  "Vendor registered successfully. Please Verify your email.");
        // Parse login status
        loginSuccess = AppUtils.parseBool(value['status'].toString());
      } else {
        print("Error: ${value['message'] ?? 'Unknown error'}");
              showInfoSnackBar(value['message'] ?? "Something went wrong.");
      }
    } else {      
            showInfoSnackBar("Unexpected response. Please try again.");
    }
        
      },);

    
  } catch (e) {
    print("Login error: $e");
      showFailureSnackBar("Login failed due to an exception.");
  }

  // Indicate success state
  change(loginSuccess, status: RxStatus.success());
  return loginSuccess;
}

}



