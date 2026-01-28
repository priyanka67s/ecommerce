import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/getx_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/login_model.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/constants.dart';
import 'package:wcart_vendor/util/preference_helper.dart';

class LoginController extends GetxController with StateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Here create the instance for HTTP access
  ApiClient apiClient = ApiClient();
  LoginModel logInData = LoginModel();

  @override
  void onInit() {
    change(null, status: RxStatus.loading());

    super.onInit();
    if (kDebugMode) {
      emailController.text = 'kavi@webnexss.in';
      passwordController.text = 'admin1234!@#';
    }
    change(null, status: RxStatus.success());
  }

  Future<bool> login() async {
    // Indicate loading state
    change(null, status: RxStatus.loading());
    bool loginSuccess = false;

    try {
      // Send login request
      Response getResponse = await apiClient.post(
        HttpUrl.login,
        {
          "email_id": emailController.text,
          "password": passwordController.text,
          "devicetoken": "12345",
        },
      );
      // Parse response to LoginModel
      logInData = LoginModel.fromJson(jsonDecode(getResponse.bodyString!));

      // Handle different statuses
      if (logInData.status == 'step2') {
        // Navigate to the next step
        Get.toNamed(Routes.singUp2);
      } else {
        // Save login details
        PreferenceHelper.setString(
            Constants.vendorId, logInData.vendorDetails!.vendorid.toString());
        PreferenceHelper.setString(Constants.servicekey,
            logInData.vendorDetails!.servicekey.toString());
        // Set login status to true
        PreferenceHelper.setBool(Constants.loginStatus, true);
        print(logInData.vendorDetails!.vendorid.toString());
        print(Constants.servicekey);

        // Update Singleton instance with vendor details
        Singleton.instance.vendorId =
            logInData.vendorDetails!.vendorid.toString();
        Singleton.instance.serviceKey =
            logInData.vendorDetails!.servicekey.toString();
        Singleton.instance.serviceKey =
            logInData.vendorDetails!.servicekey.toString();
        Singleton.instance.storeStaffId = logInData.vendorDetails.toString();
        // Parse login status
        loginSuccess = AppUtils.parseBool(logInData.status!);
      }

      // Show message to the user
      showSuccessSnackBar(
        logInData.message!,
      );
    } catch (e) {
      // Handle errors
      print('Login error: $e');
      showWarningSnackBar(
        'Login failed. Please try again.',
      );
    }

    // Indicate success state
    change(loginSuccess, status: RxStatus.success());
    return loginSuccess;
  }
}
