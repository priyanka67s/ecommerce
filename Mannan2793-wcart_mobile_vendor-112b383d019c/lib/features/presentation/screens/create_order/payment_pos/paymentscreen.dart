
// import 'package:flutter/material.dart';
// import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Print Receipt Example')),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () => printReceipt(),
//             child: Text('Print Receipt'),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> printReceipt() async {
//     try {
//       // Initialize ESC/POS printer
//       final printer = Printer(PaperSize.mm80);

//       // Discover printers
//       final printers = await printer.getBluetoothPrinters();

//       if (printers.isEmpty) {
//         print('No printers found');
//         return;
//       }

//       // Connect to the first discovered printer
//       await printer.selectPrinter(printers.first);

//       // Print receipt
//       printer.text('Store Name',
//           styles: PosStyles(align: PosAlign.center, bold: true), linesAfter: 1);
//       printer.text('123 Main St');
//       printer.text('City, Country');
//       printer.hr();
//       printer.text('Item                Qty  Price');
//       printer.text('Product 1           2    \$20.00');
//       printer.text('Product 2           1    \$10.00');
//       printer.hr();
//       printer.text('Total: \$30.00',
//           styles: PosStyles(align: PosAlign.right, bold: true));
//       printer.feed(2);
//       printer.cut();

//       await printer.finish(); // Send to printer

//       print('Receipt printed successfully');
//     } catch (e) {
//       print('Failed to print receipt: $e');
//     }
//   }
// }
