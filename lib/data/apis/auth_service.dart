import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tech_haven/utils/constants/apis.dart';

class AuthenticationWebService {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AuthenticationWebService()
      : _dio = Dio(BaseOptions(
          baseUrl: ApiUrlManager.baseUrl,
        ));

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dio.post(
      ApiUrlManager.loginEndpoint,
      data: {'email': email, 'password': password},
    );
    log(response.statusCode.toString());
    if (response.statusCode == 201) {
      return response.data;
    } else {
      // Handle login failure
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> signUp(
      String name, String email, String password) async {
    final response = await _dio.post(
      ApiUrlManager.signUpEndpoint,
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to sign up');
    }
  }

  Future<void> verifyOtp(String email, String otpCode) async {
    final response = await _dio.post(
      ApiUrlManager.otpEndpoint,
      data: {
        'email': email,
        'otp': otpCode,
      },
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final data = response.data;
      if (data.containsKey('accessToken') && data.containsKey('refreshToken')) {
        await _secureStorage.write(
            key: 'accessToken', value: data['accessToken']);
        await _secureStorage.write(
            key: 'refreshToken', value: data['refreshToken']);
        log("OTP Verification successful. AccessToken and RefreshToken stored.");
      } else {
        throw Exception('Tokens not found in response');
      }
    } else {
      throw Exception('Failed to verify OTP');
    }
  }

  Future<void> refreshAccessToken() async {
    final refreshToken = await _secureStorage.read(key: 'refreshToken');

    if (refreshToken == null) {
      throw Exception('No refresh token available');
    }

    final response = await _dio.post(
      ApiUrlManager.refreshTokenEndPoint,
      options: Options(
        headers: {
          'Authorization': 'Bearer $refreshToken',
        },
      ),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final data = response.data;
      if (data.containsKey('accessToken')) {
        await _secureStorage.write(
            key: 'accessToken', value: data['accessToken']);
        log("AccessToken refreshed and stored.");
      } else {
        throw Exception('Access Token not found in response');
      }
    } else {
      throw Exception('Failed to refresh access token');
    }
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'accessToken');
    await _secureStorage.delete(key: 'refreshToken');
    log("User logged out. Tokens removed.");
  }

  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: 'accessToken');
  }

  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: 'refreshToken');
  }

  Future<bool> checkLoginStatus() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();
    log("Current AccessToken: $accessToken");
    log("Current RefreshToken: $refreshToken");

    if (accessToken == null) {
      return false; // No access token means user is not logged in
    }

    if (refreshToken == null) {
      // Refresh token is missing, attempt to refresh the access token
      try {
        await refreshAccessToken();
        return true;
      } catch (e) {
        log("Failed to refresh token: $e");
        return false;
      }
    }

    return true; // Both tokens are present
  }
}
