import 'package:get/get.dart';

class PdfController extends GetxController {
  RxString pdfPath = ''.obs;

  void loadPdf(String path) {
    pdfPath.value = path;
  }
}
