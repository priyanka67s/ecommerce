import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:wcart_vendor/util/constants.dart';
import 'package:wcart_vendor/util/preference_helper.dart';

class SplashScreenController extends GetxController with StateMixin {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    navigateToRespectiveScreen();
    super.onInit();
    change(null, status: RxStatus.success());
  }

  navigateToRespectiveScreen() async {
    await Future.delayed(const Duration(seconds: 1), () {
      print("======== > data");
      PreferenceHelper.getBoolValue(Constants.loginStatus).then((value) async {
        // Here we checking the Login status
        if (value != null && value) {
          Singleton.instance.vendorId =
              await PreferenceHelper.getStringValue(Constants.vendorId);
          Singleton.instance.serviceKey =
              await PreferenceHelper.getStringValue(Constants.servicekey);
          Singleton.instance.storeLocationId =
              await PreferenceHelper.getStringValue(Constants.storeLocationId);              
          //!vendor login
          Get.offAndToNamed(Routes.sideBar);
          //! pos login
          // Get.offAndToNamed(Routes.multiStoreInventoryPage);
        } else {
          // Get.offAndToNamed(Routes.sideBar);
          //! navigate to login screen
          Get.offAndToNamed(Routes.login);
        }
      });
    });
  }
}
