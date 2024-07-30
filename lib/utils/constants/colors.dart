import 'package:flutter/material.dart';

abstract class ColorManager {
  const ColorManager._();

  static const Color blue = Color(0xff0062BD);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color grey = Color(0xff464646);
  static const Color error = Color(0xffF85555);
  static const Color correct = Color(0xff25BD5D);
  static const Color transparent = Colors.transparent;
}

abstract class BoxShadowManager {
  const BoxShadowManager._();

  static List<BoxShadow>? boxShadow = [
    BoxShadow(
      color: ColorManager.black.withOpacity(0.25),
      blurRadius: 20,
      spreadRadius: 5.0,
      offset: const Offset(2.0, 5.0),
    ),
  ];
}

abstract class GradientManager {
  const GradientManager._();

  static Gradient buttonGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        ColorManager.blue,
        ColorManager.blue.withOpacity(0.7),
        ColorManager.blue.withOpacity(0.37),
      ]);

  static Gradient scaffoldBackgroundGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorManager.blue.withOpacity(0.85),
        ColorManager.white,

      ]);
}
