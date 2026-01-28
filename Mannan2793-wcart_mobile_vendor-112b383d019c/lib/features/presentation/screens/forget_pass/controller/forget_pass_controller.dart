
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/http/getx_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';

import '../../../../../model/forgot_model.dart';
import '../../../widgets/toast/app_toast.dart';


class ForgetPassController extends GetxController with StateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiClient apiClient = ApiClient();
  OtpVendorResponse forgetOtpData = OtpVendorResponse();
  String OTPId = '';
  bool isShow = false;

  //!get Otp api integrate
  Future<void> getOtp() async {
    try {
      Response getResponse = await apiClient.post(
        HttpUrl.forgotPassword,
        {
          "email_id": emailController.text,
        },
      );
      print(getResponse.bodyString);
      if (getResponse.statusCode == 200) {
        isShow = true;
        change(isShow, status: RxStatus.success());
        forgetOtpData =
            OtpVendorResponse.fromJson(jsonDecode(getResponse.bodyString!));
        OTPId = forgetOtpData.otpDetails!.otpid.toString();
        debugPrint(OTPId);
        showSuccessSnackBar(
          'OTP sent successfully',
        );
      } else {
        showInfoSnackBar(
          'Forget Password failed. Please try again..!',
        );
      }
    } catch (e) {
      print('Login error: $e');
      showFailureSnackBar(
        'Forget Password failed. Please try again.',
      );
    }
  }

  //! verify OTP
  Future<bool> verifyOtp(String otpCode) async {
    try {
      Response getResponse = await apiClient.post(
        HttpUrl.verifyOtp,
        {
          "otpid": OTPId,
          "otpcode": otpCode,
          "newpassword": passwordController.text,
        },
      );
      print(getResponse.bodyString);
      if (getResponse.statusCode == 200) {
        showSuccessSnackBar(
          'OTP verified successfully',
        );
        return true;
      } else {
        showInfoSnackBar(
          'OTP verification failed. Please try again..!',
        );
        return false;
      }
    } catch (e) {
      print('Login error: $e');
      showFailureSnackBar(
        'OTP verification failed. Please try again.',
      );
      return false;
    }
  }
}
