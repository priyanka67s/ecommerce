import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wcart_vendor/config/core/error/server_excption.dart';

class ApiResponseHandler {
  static Future<T> handleResponse<T>({
    required Future<Response> Function() apiCall,
    required T Function(Map<String, dynamic> data) onSuccess,
    required T Function(String message) onError,
  }) async {
    try {      
      final response = await apiCall();
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        if (data['status'] == 'true') {
          return onSuccess(data);
        } else if (data['status'] == 'noproduct') {
          return onSuccess(data);
        } else {
          return onError(data['message'] ?? 'Unknown error occurred');
        }
      } else {
        throw ServerException('Invalid response code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      debugPrint('DioException: ${e.message}');
      if (e.response != null) {
        throw ServerException(e.response?.data['message'] ??
            e.message ??
            'Unknown error occurred');
      }
      throw ServerException(e.message ?? 'Network error occurred');
    } catch (e) {
      debugPrint('Exception: ${e.toString()}');
      throw ServerException(e.toString());
    }
  }
 
}
