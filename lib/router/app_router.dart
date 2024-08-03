import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_haven/view/screens/navbar/home.dart';
import 'package:tech_haven/view/screens/login.dart';
import 'package:tech_haven/view/screens/navbar.dart';
import 'package:tech_haven/view/screens/product_screen.dart';
import 'package:tech_haven/view/screens/sign_up.dart';
import 'package:tech_haven/viewmodel/otp/otp_cubit.dart';

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
        final String email = settings.arguments as String;
        return PageTransitionManager.fadeTransition(BlocProvider(
          create: (context) => OtpCubit(),
          child: OTPScreen(
            email: email,
          ),
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
