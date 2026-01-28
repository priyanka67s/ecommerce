// import 'package:flutter/material.dart';

// class ResponseLayoutWidget extends StatelessWidget {
//   final Widget mobile;
//   final Widget tablet;
//   final Widget desktop;
//   const ResponseLayoutWidget({
//     Key? key,
//     required this.mobile,
//     required this.tablet,
//     required this.desktop,
//   }) : super(key: key);

//   static bool isMobile(BuildContext context) =>
//       MediaQuery.sizeOf(context).width < 650;

//   static bool isTablet(BuildContext context) =>
//       MediaQuery.sizeOf(context).width < 1100 &&
//       MediaQuery.sizeOf(context).width < 650;

//   static bool isDesktop(BuildContext context) =>
//       MediaQuery.sizeOf(context).width >= 1100;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: ((context, constraints) {
//         if (constraints.maxWidth >= 1100) {
//           return desktop;
//         } else if (constraints.maxWidth >= 650) {
//           return tablet;
//         } else {
//           return mobile;
//         }
//       }),
//     );
//   }
// }
import 'package:flutter/material.dart';

class ResponseLayoutWidget extends StatelessWidget {
  final Widget smallBody;
  final Widget largeBody;

  const ResponseLayoutWidget({
    super.key,
    required this.smallBody,
    required this.largeBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth < 600) {
          return smallBody;
        } else {
          return largeBody;
        }
      }),
    );
  }
}
