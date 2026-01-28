import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/forget_pass/controller/forget_pass_controller.dart';
import 'package:wcart_vendor/features/presentation/screens/login/loginpage.dart';
import 'package:wcart_vendor/features/presentation/widgets/svg-icon.widget.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';
import 'package:wcart_vendor/util/color_resource.dart';

import '../../widgets/hover_builder/hover_builder.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({
    super.key,
    required this.formKey,
    required this.controller,
    required this.deviceType,
    required this.onTap,
  });
  final Function(LoginScreenType) onTap; // Accepts a widget and returns nothing

  final GlobalKey<FormState> formKey;
  final ForgetPassController controller;
  final UserDeviceType deviceType;
  @override
  Widget build(BuildContext context) {
    final double sizedBoxHeight = getContentDeviceSize(deviceType, 30);

    return GetBuilder<ForgetPassController>(builder: (controller) {
      return Container(
        color: ColorResource.colorffffff,
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  controller.isShow == true
                      ? controller.isShow = false
                      : onTap(LoginScreenType.login);
                  controller.change(controller.isShow,
                      status: RxStatus.success());
                },
                icon: const Icon(Icons.arrow_back)),
            Expanded(
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
                                "Forgot your password?",
                                style: TextStyle(
                                  fontSize:
                                      getContentDeviceSize(deviceType, 24),
                                  fontWeight: FontWeight.w700,
                                  color: ColorResource.color0D5EF8,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: sizedBoxHeight,
                          ),
                          controller.isShow
                              ? Column(children: [
                                  Text(
                                    "Don't worry! Resetting your password is easy. We have sent \na verification code to the email you registered with us. Please \nenter the verification code below.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          getContentDeviceSize(deviceType, 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: sizedBoxHeight,
                                  ),
                                  OtpTextField(
                                    numberOfFields: 4,
                                    borderColor: Color(0xFF512DA8),
                                    //set to true to show as box or false to show as dash
                                    showFieldAsBox: true,
                                    //runs when a code is typed in
                                    onCodeChanged: (String code) {
                                      //handle validation or checks here
                                    },
                                    //runs when every textfield is filled
                                    onSubmit: (String verificationCode) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.white,
                                              title: Center(
                                                  child: Text("New Password")),
                                              content: Container(
                                                height: 200,
                                                width: 400,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                        'Code entered is $verificationCode'),
                                                    SizedBox(
                                                      height: sizedBoxHeight,
                                                    ),
                                                    CustomTextField(
                                                      "Password",
                                                      controller
                                                          .passwordController,
                                                      validationRules: [
                                                        'required'
                                                      ],
                                                      validatorCallBack: (val) {
                                                        print(val);
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: sizedBoxHeight,
                                                    ),
                                                    MouseRegion(
                                                      cursor: SystemMouseCursors
                                                          .click,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          if (formKey
                                                                  .currentState
                                                                  ?.validate() ??
                                                              false) {
                                                            if (controller
                                                                .passwordController
                                                                .text
                                                                .isNotEmpty) {
                                                              formKey
                                                                  .currentState
                                                                  ?.save();
                                                              debugPrint(
                                                                  'object');
                                                              controller
                                                                  .verifyOtp(
                                                                      verificationCode)
                                                                  .then((onValue) =>
                                                                      onValue
                                                                          ? {
                                                                            Get.back(),
                                                                              controller.isShow = false,
                                                                              controller.change(controller.isShow, status: RxStatus.success()),
                                                                              onTap(LoginScreenType.login)

                                                                            }
                                                                          : null);
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          decoration: const BoxDecoration(
                                                              color: ColorResource
                                                                  .color0D5EF8,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          3.0))),
                                                          height: 40,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: const Center(
                                                            child: Text(
                                                              "Continue",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }, // end onSubmit
                                  ),
                                  SizedBox(
                                    height: getContentDeviceSize(
                                      deviceType,
                                      100,
                                    ),
                                  ),
                                ])
                              : Column(
                                  children: [
                                    Text(
                                      "Don't worry! Resetting your password is easy. Just type \nin the email you registered to BoardMe.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: getContentDeviceSize(
                                            deviceType, 14),
                                      ),
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
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            formKey.currentState?.save();
                                            controller.getOtp();
                                          }
                                          print('object');
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: ColorResource.color0D5EF8,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3.0))),
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: const Center(
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
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
                                          onTap(LoginScreenType.login);
                                        },
                                        onHover: (value) {},
                                        style: ButtonStyle(
                                          overlayColor:
                                              MaterialStateProperty.all(
                                            const Color.fromARGB(4, 0, 0, 0),
                                          ),
                                        ),
                                        child: Text(
                                          "Vendor Login",
                                          style: TextStyle(
                                            color: Color(
                                              0xFF8A8B8B,
                                            ),
                                            fontSize: getContentDeviceSize(
                                                deviceType, 13),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        HoverBuilder(builder: (isHover) {
                                          return Text(
                                            "Don't have an account?",
                                            style: TextStyle(
                                              color: isHover
                                                  ? Colors.blue
                                                  : Color(0xFF8A8B8B),
                                              fontSize: getContentDeviceSize(
                                                  deviceType, 14),
                                              decoration: isHover
                                                  ? TextDecoration.underline
                                                  : TextDecoration.none,
                                              decorationColor: Colors.blue,
                                            ),
                                          );
                                        }),
                                        TextButton(
                                          onPressed: () {
                                            onTap(LoginScreenType.signUp);
                                          },
                                          child: Text(
                                            "Register",
                                            style: TextStyle(
                                              color: Color(0xFF0893d1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: getContentDeviceSize(
                                                  deviceType, 15),
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
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Go to staff login",
                                            style: TextStyle(
                                              color: Color(0xFF8A8B8B),
                                              fontSize: getContentDeviceSize(
                                                  deviceType, 14),
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
                                                fontSize: getContentDeviceSize(
                                                    deviceType, 15),
                                              ),
                                            ),
                                          )
                                        ]),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
