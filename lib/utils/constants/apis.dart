import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiUrlManager {
  ApiUrlManager._();

  static String baseUrl = dotenv.env['baseUrl']!;
  static String otpEndpoint = dotenv.env['otpEndpoint']!;
  static String loginEndpoint = dotenv.env['loginEndpoint']!;
  static String signUpEndpoint = dotenv.env['signUpEndpoint']!;
}
