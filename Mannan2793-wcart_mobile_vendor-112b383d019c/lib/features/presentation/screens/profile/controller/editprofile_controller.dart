import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/vendorform_model.dart';
import 'package:wcart_vendor/model/viewprofile_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:wcart_vendor/singleton.dart';

class EditProfileController extends GetxController with StateMixin {
  ViewProfileModel viewProfileData = ViewProfileModel();

  VendorFormFieldModel formFiledData = VendorFormFieldModel();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController sateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
  final TextEditingController additionalFiledController =
      TextEditingController();

  String? image;
  File? imageFile;
  FilePickerResult? result;

  @override
  void onInit() {
    super.onInit();
    updateWarehouseData();
  }

  List<String> statusValue = ['Personal', 'Register'];

  String valueType = "Personal";

  updateWarehouseData() async {
    change(null, status: RxStatus.loading());
    // try {
    await HttpClint.urlEncoded(HttpUrl.viewProfile, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      print(value);
      if (value['status']) {
        viewProfileData = ViewProfileModel.fromJson(value['data']);
        firstNameController.text = viewProfileData.vendordata?.name ?? "";

        lastNameController.text = viewProfileData.vendordata?.lastName ?? "";
        emailController.text = viewProfileData.vendordata?.emailid ?? "";

        cityController.text = viewProfileData.vendordata?.city ?? "";
        countryController.text = viewProfileData.vendordata?.country ?? "";

        address2Controller.text = viewProfileData.vendordata?.address2 ?? "";
        address1Controller.text = viewProfileData.vendordata?.address ?? "";

        phoneNumberController.text = viewProfileData.vendordata?.phone ?? "";
        sateController.text = viewProfileData.vendordata?.state ?? "";
        cityController.text = viewProfileData.vendordata?.city ?? "";
        websiteController.text = viewProfileData.vendordata?.website ?? "";
        // valueType = statusValue[viewProfileData.vendordata!.status!];

        brandNameController.text = viewProfileData.vendordata?.brandname ?? "";
        aboutController.text = viewProfileData.vendordata?.abourbrand ?? "";
        registerNumberController.text =
            viewProfileData.vendordata?.registernumber ?? "";
        gstNumberController.text = viewProfileData.vendordata?.gstnumber ?? "";
        vatNumberController.text = viewProfileData.vendordata?.vatnumber ?? "";
        accountHolderController.text =
            viewProfileData.vendordata?.accountholder ?? "";
        accountNumberController.text =
            viewProfileData.vendordata?.accountnumber ?? "";
        bankNameController.text = viewProfileData.vendordata?.bankname ?? "";
        bankCountryController.text =
            viewProfileData.vendordata?.bankcountry ?? "";
        bankBranchController.text =
            viewProfileData.vendordata?.bankbranch ?? "";
        swiftCodeController.text = viewProfileData.vendordata?.swiftcode ?? "";
      } else {
        showInfoSnackBar(viewProfileData.message!);
      }
    });
    // } catch (e) {}
    update();
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

  Future<bool> updateProfile() async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST",
        Uri.parse('https://wcartnode.webnexs.org/vendorapi/update_profile'));
    //add text fields
    request.fields["vendorid"] = Singleton.instance.vendorId ?? "";
    // Singleton.instance.vendorId ?? Get.arguments['vendoreID'];
    request.fields["servicekey"] = Singleton.instance.serviceKey ?? "";
    // Singleton.instance.serviceKey ?? Get.arguments['servicekey'];
    request.fields["store_staff_id"] = '';
    request.fields["name"] = firstNameController.text;
    request.fields["last_name"] = lastNameController.text;
    request.fields["address1"] = address1Controller.text;
    request.fields["address2"] = address2Controller.text;
    request.fields["city"] = cityController.text;
    request.fields["state"] = sateController.text;
    request.fields["country"] = countryController.text;
    request.fields["businesstype"] = statusValue.toString();
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

    // for (var data in formFiledData.additionalFields!) {
    //   if (data.formFieldType == 1 ||
    //       data.formFieldType == 2 ||
    //       data.formFieldType == 3) {
    //     request.fields
    //         .addAll({data.formFieldSlug!: data.textController?.text ?? ''});
    //   }
    // }

    var pic = await http.MultipartFile.fromPath("brandlogo", imageFile!.path,
        contentType: MediaType('image', 'jpeg'),
        filename: imageFile!.path.split('/').last);

    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    if (response.statusCode == 200) {
      var data = jsonDecode(responseString);
      showInfoSnackBar(data['message']);
      return true;
    } else {
      return false;
    }
  }

  // vendorformfiled() async {
  //   change(null, status: RxStatus.loading());
  //   await HttpClint.get(HttpUrl.vendoreFormFiled).then((value) {
  //     print("----------------");
  //     print(value);
  //     if (value['status']) {
  //       formFiledData = VendorFormFieldModel.fromJson(value['data']);
  //     } else {
  //       print('error');
  //     }
  //   });
  //   change(formFiledData, status: RxStatus.success());
  // }
}
