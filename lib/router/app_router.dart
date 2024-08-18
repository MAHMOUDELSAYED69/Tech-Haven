import 'package:flutter/material.dart';
import 'package:tech_haven/data/apis/auth_service.dart';
import 'package:tech_haven/view/screens/navbar/home.dart';
import 'package:tech_haven/view/screens/login.dart';
import 'package:tech_haven/view/screens/navbar.dart';
import 'package:tech_haven/view/screens/product_screen.dart';
import 'package:tech_haven/view/screens/sign_up.dart';

import '../utils/constants/routes.dart';
import '../view/screens/forget_password.dart';
import '../view/screens/otp_screen.dart';
import '../view/screens/reset_password.dart';
import '../view/screens/splash.dart';
import 'page_transition.dart';

abstract class AppRouter {
  AppRouter._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.initialRoute:
        return PageTransitionManager.fadeTransition(const SplashScreen());
      case RouteManager.login:
        return PageTransitionManager.fadeTransition(const LoginScreen());
      case RouteManager.signUp:
        return PageTransitionManager.fadeTransition(const SignUpScreen());
      case RouteManager.forgotPassword:
        return PageTransitionManager.fadeTransition(
            const ForgetPasswordScreen());
      case RouteManager.otpScreen:
        final arguments = settings.arguments as Map<String, dynamic>?;

        final String email = arguments?['email'] as String? ?? '';
        final AuthRole role = arguments?['role'] as AuthRole? ?? AuthRole.user;

        return PageTransitionManager.fadeTransition(OTPScreen(
          email: email,
          role: role,
        ));
      case RouteManager.resetPassword:
        return PageTransitionManager.fadeTransition(
            const ResetPasswordScreen());
      case RouteManager.navbar:
        return PageTransitionManager.fadeTransition(const NavBarScreen());
      case RouteManager.home:
        return PageTransitionManager.fadeTransition(const HomeScreen());
      case RouteManager.productDetails:
        return PageTransitionManager.fadeTransition(
            const ProductDetailsScreen());
      default:
        return null;
    }
  }
}
