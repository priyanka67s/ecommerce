// // import 'dart:io';

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:pdf/pdf.dart';
// // import 'package:printing/printing.dart';
// // import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// // import 'package:wcart_vendor/screens/pos_method/pos_pdf/controller/pdf_controller.dart';

// // class PdfViewerPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final PdfController pdfController = Get.find();

// //     Future<void> printPdf() async {
// //       if (pdfController.pdfPath.value.isNotEmpty) {
// //         final File file = File(pdfController.pdfPath.value);
// //         await Printing.layoutPdf(
// //           onLayout: (PdfPageFormat format) async => file.readAsBytes(),
// //         );
// //       }
// //     }

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("PDF Viewer"),
// //         actions: [
// //           Padding(
// //             padding: const EdgeInsets.only(left: 20),
// //             child: IconButton(
// //               icon: Icon(Icons.print),
// //               onPressed: printPdf,
// //             ),
// //           ),
// //         ],
// //       ),
// //       body: Obx(() {
// //         if (pdfController.pdfPath.value.isEmpty) {
// //           return Center(child: CircularProgressIndicator());
// //         } else {
// //           return SfPdfViewer.file(
// //             File(pdfController.pdfPath.value),
// //           );
// //         }
// //       }),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pdf/pdf.dart';
// import 'package:printing/printing.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// // class PdfViewerPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final PdfController pdfController = Get.find();

// //     Future<void> printPdf() async {
// //       if (pdfController.pdfPath.value.isNotEmpty) {
// //         final File file = File(pdfController.pdfPath.value);
// //         try {
// //           await Printing.layoutPdf(
// //             onLayout: (PdfPageFormat format) async {
// //               final bytes = await file.readAsBytes();
// //               return bytes;
// //             },
// //           );
// //           print('Printing successful');
// //         } catch (e) {
// //           print('Printing failed: $e');
// //         }
// //       }
// //     }

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("PDF Viewer"),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.print),
// //             onPressed: printPdf,
// //           ),
// //         ],
// //       ),
// //       body: Obx(() {
// //         if (pdfController.pdfPath.value.isEmpty) {
// //           return const Center(child: CircularProgressIndicator());
// //         } else {
// //           return Center(
// //             child: SizedBox(
// //               height: 700,
// //               width: 600,
// //               child: SfPdfViewer.file(
// //                 File(pdfController.pdfPath.value),
// //               ),
// //             ),
// //           );
// //         }
// //       }),
// //     );
// //   }
// // }
// import 'package:http/http.dart' as http;

// class PdfViewerPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final pdfUrl = Get.arguments['invoice'];
//     if (pdfUrl == null || pdfUrl.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text("PDF Viewer"),
//         ),
//         body: Center(
//           child: Text("No PDF URL provided."),
//         ),
//       );
//     }

//     Future<void> printPdf() async {
//       try {
//         await Printing.layoutPdf(
//           onLayout: (PdfPageFormat format) async {
//             final response = await http.get(Uri.parse(pdfUrl));
//             if (response.statusCode == 200) {
//               return response.bodyBytes;
//             } else {
//               throw Exception('Failed to load PDF');
//             }
//           },
//         );
//         print('Printing successful');
//       } catch (e) {
//         print('Printing failed: $e');
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("PDF Viewer"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.print),
//             onPressed: printPdf,
//           ),
//         ],
//       ),
//       body: Center(
//         child: SizedBox(
//             height: 700, width: 700, child: SfPdfViewer.network(pdfUrl)),
//       ),
//     );
//   }
// }
