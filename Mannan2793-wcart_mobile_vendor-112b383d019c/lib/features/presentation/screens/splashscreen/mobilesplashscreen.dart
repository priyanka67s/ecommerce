import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/splashscreen/splashcontroller.dart';

class MobileSplashScreen extends StatefulWidget {
  const MobileSplashScreen({super.key});

  @override
  State<MobileSplashScreen> createState() => _MobileSplashScreenState();
}

class _MobileSplashScreenState extends State<MobileSplashScreen> {
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
              child: Text(
                "Wcart",
                style: TextStyle(fontSize: 40),
              ),
            )
          ],
        ),
      );
    });
  }
}
