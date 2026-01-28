import 'package:dio/dio.dart';

class ApiConfig {
  static const String serviceKey = 'by_pass_token';

  static Options get defaultOptions => Options(
        headers: {'servicekey': serviceKey},
      );

  static FormData createFormData(Map<String, dynamic> fields,
      [List<MapEntry<String, MultipartFile>>? files]) {
    final formData = FormData();
    fields.forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });

    if (files != null) {
      formData.files.addAll(files);
    }

    return formData;
  }
}
