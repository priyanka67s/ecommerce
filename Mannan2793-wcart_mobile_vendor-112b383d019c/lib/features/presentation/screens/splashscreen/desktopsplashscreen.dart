import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/splashscreen/splashcontroller.dart';

import '../../../../util/svg_icon.dart';

class DesktopSplashScreen extends StatefulWidget {
  const DesktopSplashScreen({super.key});

  @override
  State<DesktopSplashScreen> createState() => _DesktopSplashScreenState();
}

class _DesktopSplashScreenState extends State<DesktopSplashScreen> {
  SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(builder: (controller) {
      if (controller.status.isLoading) {}
      return const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgIcon(
                'assets/icon/svg/wcartlogo.svg',
                height: 400,
              ),
            )
          ],
        ),
      );
    });
  }
}
