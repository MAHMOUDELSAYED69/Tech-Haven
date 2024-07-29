import 'package:flutter/material.dart';
import 'package:tech_haven/utils/constants/colors.dart';
import 'package:tech_haven/utils/constants/images.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

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
    goToNextScreen();
  }

  Future<void> goToNextScreen() async => Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, RouteManager.login));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorManager.blue,
        body: Stack(
        children: <Widget>[
          Image.asset(ImageManager.splash ,fit: BoxFit.cover,width: context.width),
          Center(child: Image.asset(ImageManager.icon ,width: context.width/1.8),),

        ],
    ),
    );
  }
}
