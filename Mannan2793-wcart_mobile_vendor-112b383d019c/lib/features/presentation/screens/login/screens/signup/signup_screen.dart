import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/widgets/address_details.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/widgets/bank_details.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/widgets/basic_details.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/widgets/button_widget.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/widgets/store_details.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/router.dart';
import '../../../../../../util/color_resource.dart';
import 'controller/singup_step1controller.dart';

Widget signUpScreen(
  SignUpController controller,
  BuildContext context,
  GlobalKey<FormState> formKey,
  VoidCallback back,
) {
  final PageController pageController = PageController(
    initialPage: controller.currentIndex,
  );
  final basicDetailsFormKey = GlobalKey<FormState>();
  final addressDetailsFormKey = GlobalKey<FormState>();
  final bankDetailsFormKey = GlobalKey<FormState>();
  final storeDetailsFormKey = GlobalKey<FormState>();

  void nextPage() {
    GlobalKey<FormState>? currentFormKey;

    debugPrint('object===value');

    if (controller.currentIndex == 0) {
      currentFormKey = basicDetailsFormKey;
    } else if (controller.currentIndex == 1) {
      currentFormKey = addressDetailsFormKey;
    } else if (controller.currentIndex == 2) {
      currentFormKey = storeDetailsFormKey;
    } else if (controller.currentIndex == 3) {
      currentFormKey = bankDetailsFormKey;
    }

    if (currentFormKey != null && currentFormKey.currentState != null) {
      if (currentFormKey.currentState!.validate() &&
          controller.currentIndex < 3) {
        if (controller.currentIndex == 0) {
          if (controller.textControllers['password']?.text ==
              controller.textControllers['confirmPassword']?.text) {
            controller.updateIndex(controller.currentIndex + 1);
          } else {
            showWarningSnackBar('Password and Confirm Password should be same');
          }
        } else {
          controller.updateIndex(controller.currentIndex + 1);
        }

        pageController.animateToPage(
          controller.currentIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else if (currentFormKey.currentState!.validate() &&
          controller.currentIndex == 3) {
        debugPrint('object===value');
        controller.signUp().then((value) {
          print('object ===== $value');
          if (value == true) {
            // Ensure it's boolean
            Get.toNamed(Routes.splash);
          }
        });
      }
    }
  }

  void previousPage() {
    if (controller.currentIndex > 0) {
      controller.updateIndex(controller.currentIndex - 1);
      pageController.animateToPage(
        controller.currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      back();
    }
  }

  return GetBuilder<SignUpController>(
    builder: (controller) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: ColorResource.colorFFFFFF,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: ColorResource.color000000,
                          size: 20,
                        ),
                        onPressed: () {
                          previousPage();
                        },
                      ),
                      Text(
                        controller.steps[controller.currentIndex],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                controller.currentIndex != 1
                    ? const SizedBox(
                        height: 30,
                      )
                    : SizedBox(),
                controller.status.isSuccess
                    ? Expanded(
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          controller: pageController,
                          onPageChanged: (index) {
                            controller.updateIndex(index);
                          },
                          physics:
                              NeverScrollableScrollPhysics(), // Disables swipe
                          children: [
                            BasicDetails(
                              formKey: basicDetailsFormKey,
                              controller: controller,
                            ),
                            AddressDetails(
                              formKey: addressDetailsFormKey,
                              controller: controller,
                            ),
                            StoreDetails(
                              formKey: storeDetailsFormKey,
                              controller: controller,
                            ),
                            BankDetails(
                              formKey: bankDetailsFormKey,
                              controller: controller,
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: const SizedBox(
                          height: 30,
                          child: CupertinoActivityIndicator(
                            radius: 15,
                            animating: true,
                          ),
                        ),
                      ),
                controller.status.isSuccess
                    ? buttonWidget(
                        context,
                        previousPage,
                        nextPage,
                        controller,
                      )
                    : SizedBox(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
