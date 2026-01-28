// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CoreWidget extends StatefulWidget {
//   const CoreWidget({
//     super.key,
//     required this.loadingStatus,
//     this.mobile = const EmptyView(),
//     this.tablet = const EmptyView(),
//     this.desktop = const EmptyView(),
//   });
//   // : assert(
//   //         (enableDrawer) || (drawerItems != null && drawerItems.length != 0),
//   //         'You can create DrawerItem with List data and Enable the drawer',
//   //       );

//   final bool loadingStatus;
//   final Widget mobile;
//   final Widget tablet;
//   final Widget desktop;

//   @override
//   State<CoreWidget> createState() => _CoreWidgetState();
// }

// class _CoreWidgetState extends State<CoreWidget> {
//   // static bool isMobile(BuildContext context) =>
//   //     MediaQuery.sizeOf(context).width < 650;
//   // static bool isTablet(BuildContext context) =>
//   //     MediaQuery.sizeOf(context).width < 1100 &&
//   //     MediaQuery.sizeOf(context).width > 650;

//   // static bool isDesktop(BuildContext context) =>
//   //     MediaQuery.sizeOf(context).width >= 1100;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         LayoutBuilder(builder: (context, constraints) {
//           // Size size = MediaQuery.sizeOf(context);
//           // print(size.width);
//           // print(constraints.maxWidth);
//           if (
//               // isDesktop(context)
//               constraints.maxWidth >= 1000) {
//             return widget.desktop;
//           } else if (constraints.maxWidth >= 650
//               // isTablet(context)
//               ) {
//             return widget.tablet;
//           } else {
//             return widget.mobile;
//           }
//         }),
//         if (widget.loadingStatus)
//           const Opacity(
//             opacity: 0.15,
//             child: ModalBarrier(dismissible: false, color: Colors.black),
//           ),
//         if (widget.loadingStatus)
//           Center(
//             child: Container(
//               width: 41.0,
//               height: 41.0,
//               decoration: BoxDecoration(
//                 color: const Color.fromRGBO(0, 0, 0, 0.35),
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               child: const CupertinoActivityIndicator(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
