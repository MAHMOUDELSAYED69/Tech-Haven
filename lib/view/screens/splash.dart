import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_haven/utils/constants/colors.dart';
import 'package:tech_haven/utils/constants/images.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';
import 'package:tech_haven/viewmodel/auth/auth_cubit.dart';

import '../../utils/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    cubit = context.read<AuthCubit>();
    checkLogin();
    super.initState();
  }

  late AuthCubit cubit;
  Future<void> checkLogin() async {
    await cubit.refreshAccessToken();
    _isLoggedIn = await cubit.checkLoginStatus();
    log(_isLoggedIn.toString());
    goToNextScreen();
  }

  late bool _isLoggedIn;

  Future<void> goToNextScreen() async => Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(
            context, _isLoggedIn ? RouteManager.navbar : RouteManager.login),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorManager.blue,
      body: Stack(
        children: <Widget>[
          Image.asset(ImageManager.splash,
              fit: BoxFit.cover, width: context.width),
          Center(
            child: Image.asset(ImageManager.icon, width: context.width / 1.8),
          ),
        ],
      ),
    );
  }
}
