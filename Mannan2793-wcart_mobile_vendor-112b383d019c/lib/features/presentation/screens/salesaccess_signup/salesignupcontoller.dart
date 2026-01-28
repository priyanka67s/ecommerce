import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SalessignupContoller extends GetxController with StateMixin {
  TextEditingController customernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countrycodeController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    change(null, status: RxStatus.loading());

    super.onInit();
    change(null, status: RxStatus.success());
  }
}
