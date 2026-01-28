import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/login/loginpage.dart';
import 'package:wcart_vendor/features/presentation/widgets/hover_builder/hover_builder.dart';
import '../../../../../router.dart';
import '../../../../../util/app_utils.dart';
import '../../../../../util/color_resource.dart';
import '../../../../../util/svg_icon.dart';
import '../../../widgets/textformfield.dart';
import '../controller/logincontroller.dart';

class LayerTwo extends StatelessWidget {
  const LayerTwo({
    super.key,
    required this.formKey,
    required this.controller,
    required this.deviceType,
    required this.onTap,
  });
  final Function(LoginScreenType) onTap; // Accepts a widget and returns nothing

  final GlobalKey<FormState> formKey;
  final LoginController controller;
  final UserDeviceType deviceType;

  @override
  Widget build(BuildContext context) {
    final double sizedBoxHeight = getContentDeviceSize(deviceType, 30);

    return Container(
      color: ColorResource.colorffffff,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              getContentPadding(deviceType, 70),
              getContentPadding(deviceType, 50),
              getContentPadding(deviceType, 70),
              getContentPadding(
                deviceType,
                50,
              ),
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgIcon(
                        'assets/icon/svg/wcartlogo.svg',
                        height: getContentDeviceSize(deviceType, 50),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login to access your account",
                        style: TextStyle(
                          fontSize: getContentDeviceSize(deviceType, 24),
                          fontWeight: FontWeight.w700,
                          color: ColorResource.color0D5EF8,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  CustomTextField(
                    "Email",
                    controller.emailController,
                    validationRules: ['email'],
                    validatorCallBack: (val) {
                      print(val);
                    },
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  CustomTextField(
                    "Password",
                    controller.passwordController,
                    validationRules: ['required'],
                    validatorCallBack: (val) {
                      print(val);
                    },
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          formKey.currentState?.save();
                          controller.login().then((value) {
                            print('object ===== $value');
                            if (value) {
                              controller.emailController.clear();
                              controller.passwordController.clear();
                              Get.toNamed(Routes.splash);
                            }
                          });
                        }
                        print('object');
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: ColorResource.color0D5EF8,
                            borderRadius:
                                BorderRadius.all(
                            Radius.circular(3.0),
                          ),
                        ),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getContentDeviceSize(
                      deviceType,
                      10,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        onTap(LoginScreenType.forgetPassword);
                      },
                      onHover: (value) {},
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          const Color.fromARGB(4, 0, 0, 0),
                        ),
                      ),
                      child: Text(
                        "Forgot password ?",
                        style: TextStyle(
                          color: Color(
                            0xFF8A8B8B,
                          ),
                          fontSize: getContentDeviceSize(deviceType, 13),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HoverBuilder(builder: (isHover) {
                        return Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: isHover ? Colors.blue : Color(0xFF8A8B8B),
                            fontSize: getContentDeviceSize(deviceType, 14),
                            decoration: isHover
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            decorationColor: Colors.blue,
                          ),
                        );
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          onTap(LoginScreenType.signUp);
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Color(0xFF0893d1),
                            fontWeight: FontWeight.bold,
                            fontSize: getContentDeviceSize(deviceType, 15),                            
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  continueOrWidget(
                    context,
                    deviceType,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Go to staff login",
                      style: TextStyle(
                        color: Color(0xFF8A8B8B),
                        fontSize: getContentDeviceSize(deviceType, 14),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        onTap(LoginScreenType.staffLogin);
                      },
                      child: Text(
                        "Staff Login",
                        style: TextStyle(
                          color: Color(0xFF0893d1),
                          fontWeight: FontWeight.bold,
                          fontSize: getContentDeviceSize(deviceType, 15),
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
