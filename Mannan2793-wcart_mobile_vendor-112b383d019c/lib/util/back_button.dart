import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildBackButton() {
  return Builder(
    builder: (context) {
      // Check if we can go back using GetX
      bool canGoBack = Navigator.of(context).canPop();
      debugPrint("pop $canGoBack");
      // Only show the button if we can go back
      return canGoBack
          ? MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            )
          : SizedBox.shrink(); // Empty widget if we can't go back
    },
  );
}
