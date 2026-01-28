import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/stafflogin_model.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/constants.dart';
import 'package:wcart_vendor/util/preference_helper.dart';
// import 'package:wcart_vendor/widgets/demo_drawer.dart';

class SaleManController extends GetxController with StateMixin {
  TextEditingController saleManUserNameController = TextEditingController();
  TextEditingController saleManPassWordController = TextEditingController();
  StaffLoginModel staffLoginData = StaffLoginModel();

  @override
  void onInit() {
    change(null, status: RxStatus.loading());

    super.onInit();

    if (kDebugMode) {
      saleManUserNameController.text = 'anbu@gmail.com';
      saleManPassWordController.text = '123456';
    }
    change(null, status: RxStatus.success());
  }

  staffLogin() async {
    bool staffloginSucess = false;
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.stafflogin, body: {
      "email": saleManUserNameController.text,
      "password": saleManPassWordController.text,
      "devicetoken": "1",
    }).then((value) {
      print(value);
      if (value['status']) {
        staffLoginData = StaffLoginModel.fromJson(value['data']);
        PreferenceHelper.setString(Constants.userType,
            staffLoginData.vendorDetails!.keytype.toString());
        PreferenceHelper.setString(Constants.storeLocationId,
            staffLoginData.vendorDetails!.storeLocationId.toString());

        // Here we set the login status true (Login success)
        PreferenceHelper.setBool(Constants.loginStatus, true);
        PreferenceHelper.setString(Constants.vendorId,
            staffLoginData.vendorDetails!.vendorid.toString());
        PreferenceHelper.setString(Constants.servicekey,
            staffLoginData.vendorDetails!.servicekey.toString());
        PreferenceHelper.setString(Constants.storeStaffId,
            staffLoginData.vendorDetails!.storeStaffId.toString());
        PreferenceHelper.setString(
            Constants.active, staffLoginData.vendorDetails!.active.toString());
        PreferenceHelper.setString(Constants.warehouseId,
            staffLoginData.vendorDetails!.warehouseId.toString());
        // PreferenceHelper.setString(Constants.warehouseId,
        //     StaffloginData.vendorDetails!.vendorStoreId.toString());
        Singleton.instance.storeLocationId =
            staffLoginData.vendorDetails!.storeLocationId.toString();

        Singleton.instance.vendorId =
            staffLoginData.vendorDetails!.vendorid.toString();
        Singleton.instance.serviceKey =
            staffLoginData.vendorDetails!.servicekey.toString();
        Singleton.instance.storeStaffId =
            staffLoginData.vendorDetails!.storeStaffId.toString();
        Singleton.instance.warehouseId =
            staffLoginData.vendorDetails!.warehouseId.toString();
        Singleton.instance.active =
            staffLoginData.vendorDetails!.active.toString();

        staffloginSucess = AppUtils.parseBool(staffLoginData.status!);
        if (staffloginSucess) {
          saleManUserNameController.clear();
          saleManPassWordController.clear();

          Get.toNamed(Routes.splash);
        }
        showInfoSnackBar(
          staffLoginData.message!,
        );
      } else {
        print('error');
      }
    });
    change(StaffLoginModel, status: RxStatus.success());
    return staffloginSucess;
  }
}
