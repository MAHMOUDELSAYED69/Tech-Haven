import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiUrlManager {
  ApiUrlManager._();

  static String baseUrl = dotenv.env['baseUrl']!;
  static String loginEndpoint = dotenv.env['loginEndpoint']!;
  static String signUpEndpoint = dotenv.env['signUpEndpoint']!;

  static String userOtpEndpoint = dotenv.env['userOtpEndpoint']!;
  static String adminOtpEndpoint = dotenv.env['adminOtpEndpoint']!;

  static String userRefreshTokenEndPoint =
      dotenv.env['userRefreshTokenEndPoint']!;
  static String adminRefreshTokenEndPoint =
      dotenv.env['adminRefreshTokenEndPoint']!;
}
