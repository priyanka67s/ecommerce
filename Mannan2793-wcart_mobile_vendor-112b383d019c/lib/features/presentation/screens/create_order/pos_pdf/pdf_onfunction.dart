import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/pos_pdf/controller/pdf_controller.dart';

class PdfOnFunctionPage extends StatefulWidget {
  const PdfOnFunctionPage({super.key});

  @override
  State<PdfOnFunctionPage> createState() => _PdfOnFunctionPageState();
}

class _PdfOnFunctionPageState extends State<PdfOnFunctionPage> {
  final PdfController pdfController = Get.put(PdfController());
  void _pickAndOpenPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      String filePath = result.files.single.path!;
      pdfController.loadPdf(filePath);
      // Get.to(() => PdfViewerPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _pickAndOpenPdf,
          child: const Text('Pick and View PDF'),
        ),
      ),
    );
  }
}
