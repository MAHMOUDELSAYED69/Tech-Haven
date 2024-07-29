import 'package:flutter/material.dart';

import '../../utils/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> goToNextScreen() async => Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.pushReplacementNamed(context, RouteManager.login));

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
