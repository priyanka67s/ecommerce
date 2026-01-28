import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/activestorelocation_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:wcart_vendor/model/activewarehouse_model.dart';
import 'package:wcart_vendor/model/changevendorpassword_model.dart';
import 'package:wcart_vendor/model/staffroles_model.dart';
import 'package:wcart_vendor/model/viewvendorstaff_model.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_staff/controller/liststaff_controller.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:wcart_vendor/util/string_resources.dart';

class AddNewWareHouseStaffController extends GetxController with StateMixin {
  ListStaffController controller = Get.put(ListStaffController());
  String? wareHouseSelectedStatusValueList;
  String? locationSelectedStatusValueList;
  String? defaultSelectedLocationValueList;
  List<String> territoryDropdownList = [];
  String? selectedTerritory;
  int? territoryId;

  var storeLocationDropDownValue;
  var wareHouseLocationValue;
  var staffRolesNameValue;
  String staffRoleValue = '';
  String warehouseLocationId = '';

  List<String> statusDropdownList = ["Disabled", 'Active', "Blocked"];

  String statusValue = '1';
  // AddWarehouseModel manageWarehouse = AddWarehouseModel();
  ActiveStoreLocationModel activeStoreLocationData = ActiveStoreLocationModel();

  ActiveWareHouseModel activeWareHouseData = ActiveWareHouseModel();

  ViewVendorStaffModel editStaffData = ViewVendorStaffModel();

  StaffRolesModel staffRolesData = StaffRolesModel();


  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? image;
  File? imageFile;
  FilePickerResult? result;
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    print('-------Muthu-----');

    super.onInit();

    if (Get.arguments['fromScreen'] == StringResources.editStaff) {
      getViewVendorData();
    }
    staffRoles();
    activeWarehouse();
    // addVendorStaff();
    activeStoreLocation();
    change(null, status: RxStatus.success());
  }

  Future<dynamic> addVendorStaff() async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST",
        Uri.parse('https://wcartnode.webnexs.org/vendorapi/vendor_add_staff'));
    //add text fields
    request.fields["vendorid"] = Singleton.instance.vendorId ?? "";
    request.fields["servicekey"] = Singleton.instance.serviceKey ?? "";    
    request.fields["staff_type"] = '1';
    request.fields["user_name"] = userNameController.text;
    request.fields["email"] = emailController.text;
    request.fields["location_id"] = warehouseLocationId.isEmpty
        ? activeWareHouseData.warehouseAddress![0].warehouseId.toString()
        : warehouseLocationId.toString();
    request.fields["staff_role_id"] = staffRoleValue.isEmpty
        ? staffRolesData.roles![0].staffRoleId.toString()
        : staffRoleValue.toString();
    request.fields["staff_status"] =
        statusValue.toString() == '2' ? '9' : statusValue.toString();
    // statusDropdownList.indexOf.toString();
    request.fields["password"] = passwordController.text;
    //create multipart using filepath, string or bytes
    // if (Get.arguments != null &&
    //     Get.arguments['fromScreen'] == StringResources.editvendor) {
    //   request.fields["brand_id"] = Get.arguments['brandId'].toString();
    // }
if (imageFile != null) {
      var pic = await http.MultipartFile.fromPath(
        "profile_image", imageFile!.path,
        contentType: MediaType('image', 'jpeg'),
        filename: imageFile!.path.split('/').last);

    //add multipart to request
    request.files.add(pic);
}

    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    if (response.statusCode == 200) {
      Get.back(result: true);
      controller.allStaff();
      var jsonData = json.decode(responseString);
      showSuccessSnackBar(
        jsonData['message'],
        // responseString
        //     .replaceAll('{"status":"true","message":"', '')
        //     .replaceAll('"}', '')
      );
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

  activeStoreLocation() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.activeStoreLocation, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      'store_staff_id': ''
    }).then((value) {
      print('-------muthuvel-------Store Location');
      print(value);
      if (value['status']) {
        activeStoreLocationData =
            ActiveStoreLocationModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(activeStoreLocationData, status: RxStatus.success());
  }

  getViewVendorData() async {
    change(null, status: RxStatus.loading());
    // try {    
    await HttpClint.urlEncoded(HttpUrl.vendorViewStaff, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "store_staff_id": Get.arguments['staffId'].toString(),
    }).then((value) {
      print(value);
      if (value['status']) {
        editStaffData = ViewVendorStaffModel.fromJson(value['data']);
        userNameController.text = editStaffData.viewStaff![0].userName ?? "";
        emailController.text = editStaffData.viewStaff![0].email ?? "";
        passwordController.text = editStaffData.viewStaff![0].password ?? "";
staffRolesNameValue =
            editStaffData.viewStaff![0].staffRoleId?.toString() ?? "";
        final status = editStaffData.viewStaff![0].active!.toString();
        statusValue = status == '9' ? '2' : statusValue;        
        image =
            '${editStaffData.viewStaff![0].imageUrl}';
        change(image);
      } else {
        showInfoSnackBar(editStaffData.message!);
      }
    });
    // } catch (e) {}
    update();
    change(null, status: RxStatus.success());
  }

  Future<dynamic> updateVendorStaff() async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
        "POST",
        Uri.parse(
            'https://wcartnode.webnexs.org/vendorapi/vendor_update_staff'));
    //add text fields
    request.fields["vendorid"] = Singleton.instance.vendorId ?? "";
    request.fields["servicekey"] = Singleton.instance.serviceKey ?? "";
    request.fields["store_staff_id"] = '0';
    request.fields["edit_store_staff_id"] =
        editStaffData.viewStaff![0].storeStaffId.toString() ?? '';  
    request.fields["user_name"] = userNameController.text;
    request.fields["email"] = emailController.text;
    request.fields["location_id"] = warehouseLocationId.isEmpty
        ? activeWareHouseData.warehouseAddress![0].warehouseId.toString()
        : warehouseLocationId.toString();
    request.fields["staff_role_id"] = staffRoleValue.isEmpty
        ? staffRolesData.roles![0].staffRoleId.toString()
        : staffRoleValue.toString();
    request.fields["staff_status"] =
        statusValue.toString() == '2' ? '9' : statusValue.toString();
    ;
    request.fields["staff_profile_image"] =
        editStaffData.viewStaff![0].profileImage.toString();

    
if (imageFile != null) {
      var pic = await http.MultipartFile.fromPath(
        "staff_profile_image", imageFile!.path,
        contentType: MediaType('image', 'jpeg'),
        filename: imageFile!.path.split('/').last,
      );

    //add multipart to request
    request.files.add(pic);
}
    
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    if (response.statusCode == 200) {
      controller.allStaff();
      Get.back(result: true);
      var jsonData = json.decode(responseString);
      showInfoSnackBar(jsonData['message']);
    }
  }

  activeWarehouse() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.activeWarehouse, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      // print(value);
      if (value['status']) {
        activeWareHouseData = ActiveWareHouseModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(activeWareHouseData, status: RxStatus.success());
  }

  staffRoles() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.staffRoles, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      // print(value);
      if (value['status']) {
        staffRolesData = StaffRolesModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(staffRolesData, status: RxStatus.success());
  }

  changePassword(BuildContext context, String argument, String id) async {
    print('pass');
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.vendorChangePassword, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "store_staff_id":
          editStaffData.viewStaff![0].storeStaffId.toString() ?? '',
      "newpassword": newPasswordController.text,
      "conpassword": confirmPasswordController.text,      
    }).then((value) {
      print(value);
      if (value['status']) {
        print('pass');
        
      } else {
        print('error');
      }
    });
    change(null, status: RxStatus.success());
  }
}
