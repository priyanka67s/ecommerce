import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/controller/singup_step1controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';

Row buttonWidget(
  BuildContext context,
  VoidCallback back,
  VoidCallback nextPage,
  SignUpController controller,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      controller.currentIndex == 0
          ? SizedBox()
          : MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  back();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                    border: Border.all(color: ColorResource.color0D5EF8),
                  ),
                  height: AppUtils.vs(65, context),
                  width: AppUtils.vs(250, context),
                  child: Center(
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: ColorResource.color0D5EF8,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
      const SizedBox(
        width: 10,
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            print('object');
            nextPage();
          },
          child: Container(
            decoration: const BoxDecoration(
                color: ColorResource.color0D5EF8,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            height: AppUtils.vs(65, context),
            width: AppUtils.vs(250, context),
            child: Center(
              child: Text(
                controller.currentIndex == 3 ? "Register Now" : "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}