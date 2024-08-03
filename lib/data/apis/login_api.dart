import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_haven/utils/constants/apis.dart';

class LoginService {
   final Dio _dio = Dio();
   final String _loginUrl =
      ApiUrlManager.baseUrl + ApiUrlManager.loginEndpoint;

   Future<dynamic> login(String email, String password) async {
    try {
      final response = await _dio.post(
        _loginUrl,
        data: {
          'email': email,
          'password': password,
        },
      );
      log(response.data.toString());
      log('Login successful');

      return response.data['user'];
    } on DioException catch (err) {
      log('Login Service: Failed to login: $err');
      return err.message.toString();
    }
  }
}