import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';

import '../util/app_utils.dart';
import 'http_url.dart';

class HttpClint {
  static Future<dynamic> post(String url, {dynamic body}) async {
    http.Response response = await http.post(
      Uri.parse(HttpUrl.appBaseUrl + url),
      body: body,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);      
      if (data['status']) {
        return {'status': true, 'data': data};
      } else {
        showInfoSnackBar(data['message']);
        return {'status': false, 'data': data};
      }
    } else {
      showInfoSnackBar('something went wrong!');
    }
  }

  static Future<dynamic> get(String url) async {
    http.Response response =
        await http.get(Uri.parse(HttpUrl.appBaseUrl + url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // print(data);
      if (AppUtils.parseBool(data['status'])) {
        return {'status': true, 'data': data};
      } else {
        showInfoSnackBar(data['message']);
        return {'status': false, 'data': data};
      }
    } else {
      showInfoSnackBar('something went wrong!');
    }
  }

  static Future<dynamic> urlEncoded(String url, {dynamic body}) async {
    http.Response value = await http.post(
      Uri.parse(HttpUrl.appBaseUrl + url),
      body: body,
      headers: {
        'servicekey': 'by_pass_token',
        'Content-Type': 'application/x-www-form-urlencoded',        
      },
    );
    if (value.statusCode == 200) {
      var data = await jsonDecode(value.body);
      debugPrint(data.toString());
      if (AppUtils.parseBool(data['status'])) {        
        return {'status': true, 'data': data};
      } else {  
        showInfoSnackBar(data['message']);
        return {'status': false, 'data': data};
      }
    } else {
      showInfoSnackBar('something went wrong!');
    }
    // await returnResponseData(response);
  }
}
