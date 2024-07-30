import 'package:flutter/material.dart';
import 'package:tech_haven/view/screens/login.dart';
import 'package:tech_haven/view/screens/sign_up.dart';

import '../utils/constants/routes.dart';
import '../view/screens/forget_password.dart';
import '../view/screens/splash.dart';
import 'page_transition.dart';

abstract class AppRouter {
  AppRouter._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.initialRoute:
        return PageTransitionManager.fadeTransition(const SplashScreen());
      case RouteManager.login:
        return PageTransitionManager.materialPageRoute(const LoginScreen());
      case RouteManager.signUp:
        return PageTransitionManager.fadeTransition(const SignUpScreen());
      case RouteManager.forgotPassword:
        return PageTransitionManager.fadeTransition(const ForgetPasswordScreen());
      default:
        return null;
    }
  }
}
