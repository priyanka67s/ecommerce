import 'package:animated_loading_bar/animated_loading_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/back_button.dart';
import 'package:wcart_vendor/util/color_resource.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.titleText,
      required this.onBackButtonPressed,
      this.showAction,
      this.isLoading});
  final String titleText;
  final bool? showAction;  
  final VoidCallback onBackButtonPressed;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: AppUtils.vs(98, context),
          alignment: Alignment.centerRight,
          
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child:
                Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,                      
                      children: [
                        buildBackButton(),                        
                        Text(
                          titleText,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorResource.color000000,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  if (showAction != null && showAction == true)
                    Row(
                    children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Get.offAllNamed(Routes.sideBar, arguments: {
                                'screen': 'profile',
                              });
                            },
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      // SizedBox(
                      //   width: 15,
                      // ),
                      // Text(
                      //   'Help',
                      //   style: TextStyle(
                      //     fontSize: 12.sp,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 15,
                      // ),
                      // Text(
                      //   'Shortcuts',
                      //   style: TextStyle(
                      //     fontSize: 12.sp,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                        SizedBox(
                          width: 15,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              onBackButtonPressed();
                            },
                            child: Text(
                              'Refresh',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                          ),
                          ),
                        ),
                    ],
                  )
                ]),
          ),
        ),
        (isLoading != null && isLoading == true)
            ? AnimatedLoadingBar(
                colors: [Colors.red, Colors.blue, Colors.green, Colors.purple],
                height: 3.0,
                duration: Duration(seconds: 2),
              )
            : const SizedBox(),
        // const SizedBox(
        //   height: 7,
        // ),
        // Container(
        //   height: AppUtils.vs(95, context),
        //   padding: EdgeInsets.symmetric(horizontal: 20),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(5),
        //     color: Colors.white,
        //   ),
        //   child: Row(
        //     children: [
        //       Text(
        //         titleText,
        //         style: TextStyle(
        //           fontSize: 13.sp,
        //           color: ColorResource.color000000,
        //           fontWeight: FontWeight.w600,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        
      ],
    );
  }
}
