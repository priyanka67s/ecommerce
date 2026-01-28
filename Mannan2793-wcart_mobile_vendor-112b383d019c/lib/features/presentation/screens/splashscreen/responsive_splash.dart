import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/screens/splashscreen/desktopsplashscreen.dart';
import 'package:wcart_vendor/features/presentation/screens/splashscreen/mobilesplashscreen.dart';
import 'package:wcart_vendor/features/presentation/widgets/response_layout_widget.dart';

class SplashMainScreen extends StatelessWidget {
  const SplashMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponseLayoutWidget(
      smallBody: MobileSplashScreen(),
      largeBody: DesktopSplashScreen(),
    );
  }
}
