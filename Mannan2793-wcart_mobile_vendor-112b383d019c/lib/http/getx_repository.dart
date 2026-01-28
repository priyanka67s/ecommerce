import 'package:get/get.dart';
import 'package:wcart_vendor/http/http_url.dart';

class ApiClient extends GetConnect implements GetxService {
  // late String token;
  late Map<String, String> mainHeaders;

  ApiClient() {
    baseUrl = HttpUrl.appBaseUrl;
    timeout = const Duration(seconds: 3);
    // token = sharedPreferences.getString(AppConstants.TOKEN)??"";
    mainHeaders = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'servicekey': "by_pass_token",
      // 'Content-Type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer $token',
    };
  }
}
