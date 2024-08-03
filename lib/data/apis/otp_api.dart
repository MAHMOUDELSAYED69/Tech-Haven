import 'dart:developer';

import 'package:dio/dio.dart';

import '../../utils/constants/apis.dart';

class OtpService {
  static final Dio _dio = Dio();
  static final String _verifyUrl = ApiUrlManager.baseUrl + ApiUrlManager.otpEndpoint;

  static Future<Response> verifyOtp(String email, String otp) async {
    try {
      final response = await _dio.post(
        _verifyUrl,
        data: {
          'email': email,
          'otp': otp,
        },
      );
      return response;
    } on DioException catch (err) {
      log('OTP Service: Failed to verify OTP: $err');
      rethrow;
    }
  }
}
