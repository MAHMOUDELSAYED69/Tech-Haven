import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tech_haven/utils/constants/apis.dart';

class SignUpService {
  static final Dio _dio = Dio();
  static final String _signupUrl =
      ApiUrlManager.baseUrl + ApiUrlManager.signUpEndpoint;

  static Future<dynamic> signUp(
      String name, String email, String password) async {
    try {
      final response = await _dio.post(
        _signupUrl,
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      return response.data['user'];
    } on DioException catch (err) {
      log('SignUp Service: Failed to sign up: $err');
      return err.message.toString();
    }
  }
}
