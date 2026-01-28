// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:wcart_vendor/util/app_utils.dart';
// import 'package:wcart_vendor/util/color_resource.dart';
// import 'package:wcart_vendor/util/custom_appbar.dart';
// import 'package:wcart_vendor/util/svg_icon.dart';

// import 'package:wcart_vendor/widgets/textformfield.dart';

// class ItemsPage extends StatefulWidget {
//   const ItemsPage({super.key});

//   @override
//   State<ItemsPage> createState() => _ItemsPageState();
// }

// class _ItemsPageState extends State<ItemsPage> {
//   TextEditingController partyNameController = TextEditingController();
//   List<String> listValue = ['Basic', "Offer", "Deal"];
//   String value = 'Basic';
//   bool _switchValue = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorResource.colorF3F4F8,
//       body: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               children: [
//                 const CustomAppBar(),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(left: 20, right: 7),
//                   height: AppUtils.vs(85, context),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: Colors.white),
//                   child: Center(
//                     child: Text(
//                       'Welcome to WCart',
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         color: ColorResource.color000000,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 Expanded(
//                   child: Container(
//                     margin: const EdgeInsets.only(left: 20, right: 7),
//                     height: AppUtils.vs(946, context),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Add Items",
//                                 style: TextStyle(
//                                   fontSize: 12.sp,
//                                   color: ColorResource.color252525,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 25,
//                               ),
//                               Text(
//                                 "Product",
//                                 style: TextStyle(
//                                   fontSize: 12.sp,
//                                   color: ColorResource.color252525,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 1,
//                               ),
//                               Transform.scale(
//                                 scale: 0.5,
//                                 child: CupertinoSwitch(
//                                   activeColor: ColorResource.color0D5EF8,
//                                   value: _switchValue,
//                                   onChanged: (bool value) {
//                                     setState(() {
//                                       _switchValue = value;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               Text(
//                                 "Service",
//                                 style: TextStyle(
//                                   fontSize: 12.sp,
//                                   color: ColorResource.color252525,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Divider(
//                           thickness: 0.5,
//                           color: ColorResource.colorDDDDDD,
//                         ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: SizedBox(
//                                   height: 40,
//                                   width: 230,
//                                   child: CustomTextField(
//                                       "Item Name*", partyNameController)),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: SizedBox(
//                                   height: 40,
//                                   width: 230,
//                                   child: CustomTextField(
//                                       "Item HSN", partyNameController)),
//                             ),
//                             Container(
//                               decoration: const BoxDecoration(
//                                   color: ColorResource.color0D5EF8,
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(3.0))),
//                               height: AppUtils.vs(65, context),
//                               width: AppUtils.vs(200, context),
//                               child: const Center(
//                                 child: Text(
//                                   "Select Unit",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 14),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: SizedBox(
//                                   height: 40,
//                                   width: 230,
//                                   child: CustomTextField(
//                                       "Item Name*", partyNameController)),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: SizedBox(
//                                   height: 40,
//                                   width: 230,
//                                   child: CustomTextField(
//                                     "Item code",
//                                     partyNameController,
//                                     suffixWidget: Container(
//                                       height: 10,
//                                       color: ColorResource.color203052,
//                                     ),
//                                   )),
//                             ),
//                             const Row(
//                               children: [
//                                 SvgIcon(
//                                   'assets/icon/svg/camer.svg',
//                                   height: 30,
//                                 ),
//                                 Text(
//                                   'Add Item Image',
//                                   style: TextStyle(
//                                       color: ColorResource.color0D5EF8,
//                                       fontSize: 12),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
//                           child: Row(
//                             children: [
//                               Text("Pricing"),
//                               SizedBox(width: 15),
//                               Text("Stock"),
//                               SizedBox(width: 15),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
//                           child: Row(
//                             children: [
//                               Container(
//                                 height: 2,
//                                 width: 50,
//                                 color: ColorResource.colorED1A3B,
//                               )
//                             ],
//                           ),
//                         ),
//                         const Divider(
//                           thickness: .5,
//                           color: ColorResource.colorDDDDDD,
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Container(
//                             height: AppUtils.vs(190, context),
//                             width: double.infinity,
//                             color: ColorResource.colorF6F8FF,
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     children: [
//                                       Text(
//                                         "Sale Price",
//                                         style: TextStyle(
//                                           fontSize: 12.sp,
//                                           color: ColorResource.color252525,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                           height: 40,
//                                           width: 134,
//                                           child: CustomTextField("Sale Price",
//                                               partyNameController)),
//                                       SizedBox(
//                                           height: 40,
//                                           width: 134,
//                                           child: CustomTextField("Without Tax",
//                                               partyNameController)),
//                                       const SizedBox(
//                                         width: 40,
//                                       ),
//                                       SizedBox(
//                                           height: 40,
//                                           width: 134,
//                                           child: CustomTextField(
//                                               "Disc.. on Sale pric.",
//                                               partyNameController)),
//                                       SizedBox(
//                                           height: 40,
//                                           width: 134,
//                                           child: CustomTextField("Percentage",
//                                               partyNameController)),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     children: [
//                                       Text(
//                                         "+ Add Wholesale Price",
//                                         style: TextStyle(
//                                           fontSize: 10.sp,
//                                           color: ColorResource.color0D5EF8,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//                             children: [
//                               Container(
//                                 height: AppUtils.vs(150, context),
//                                 width: AppUtils.hs(636, context),
//                                 color: ColorResource.colorF6F8FF,
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             "Purchase Price",
//                                             style: TextStyle(
//                                               fontSize: 12.sp,
//                                               color: ColorResource.color252525,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Row(
//                                         children: [
//                                           SizedBox(
//                                               height: 40,
//                                               width: 134,
//                                               child: CustomTextField(
//                                                   "Sale Price",
//                                                   partyNameController)),
//                                           SizedBox(
//                                               height: 40,
//                                               width: 134,
//                                               child: CustomTextField(
//                                                   "Without Tax",
//                                                   partyNameController)),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Container(
//                                 height: AppUtils.vs(150, context),
//                                 width: AppUtils.hs(636, context),
//                                 color: ColorResource.colorF6F8FF,
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             "Taxes",
//                                             style: TextStyle(
//                                               fontSize: 12.sp,
//                                               color: ColorResource.color252525,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Row(
//                                         children: [
//                                           SizedBox(
//                                               height: 40,
//                                               width: 134,
//                                               child: CustomTextField("Tax Rate",
//                                                   partyNameController)),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 75,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                   color: ColorResource.color0D5EF8
//                                       .withOpacity(0.07),
//                                   spreadRadius: 0.0,
//                                   blurRadius: 25.0,
//                                   offset: const Offset(0.0, 8.0)),
//                             ],
//                             color: Colors.white,
//                           ),
//                           height: AppUtils.vs(139, context),
//                           width: double.infinity,
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 25),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Container(
//                                   height: AppUtils.vs(65, context),
//                                   width: AppUtils.vs(200, context),
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: ColorResource.color0D5EF8),
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(3.0))),
//                                   child: const Center(
//                                     child: Text(
//                                       "Save & New",
//                                       style: TextStyle(
//                                           color: Color(0xFF1D4ED8),
//                                           fontSize: 14),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 20,
//                                 ),
//                                 Container(
//                                   decoration: const BoxDecoration(
//                                       color: ColorResource.color0D5EF8,
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(3.0))),
//                                   height: AppUtils.vs(65, context),
//                                   width: AppUtils.vs(200, context),
//                                   child: const Center(
//                                     child: Text(
//                                       "Save",
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 14),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatApp extends StatelessWidget {
  const WhatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('WhatsApp Integration')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              launchWhatsApp();
            },
            child: Text('Share on WhatsApp'),
          ),
        ),
      ),
    );
  }
}

// void shareToWhatsApp(String message) async {
//   final String url =
//       "https://api.whatsapp.com/send?text=${Uri.encodeFull(message)}";
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
void launchWhatsApp() async {
  final String url = "https://api.whatsapp.com/send?text=Hello!";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}
