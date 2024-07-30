import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/constants/fonts.dart';

import '../constants/colors.dart';

abstract class AppTheme {
  //!! LIGHT THEME
  static ThemeData get lightTheme {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.blue,
        selectionColor: ColorManager.blue.withOpacity(0.3),
        selectionHandleColor: ColorManager.blue,
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          overlayColor:
              WidgetStatePropertyAll(ColorManager.blue.withOpacity(0.1)),
          foregroundColor: const WidgetStatePropertyAll(ColorManager.blue),
          side: WidgetStatePropertyAll(
            BorderSide(
              width: 3,
              color: ColorManager.blue.withOpacity(0.3),
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          fixedSize: WidgetStatePropertyAll(
            Size(95.w, 50.h),
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          elevation:const WidgetStatePropertyAll(5),
          overlayColor: WidgetStatePropertyAll(ColorManager.white.withOpacity(0.2)),
          foregroundColor: const WidgetStatePropertyAll(ColorManager.white),
          shape:WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),

          fixedSize: WidgetStatePropertyAll(
            Size(double.maxFinite, 40.h),
          ),
        ),
      ),

      checkboxTheme: CheckboxThemeData(
        checkColor: const WidgetStatePropertyAll(ColorManager.white),
        fillColor: const WidgetStatePropertyAll(ColorManager.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        side: const BorderSide(color: ColorManager.blue, width: 1),
      ),
      //

      iconTheme: const IconThemeData(color: ColorManager.blue),
      switchTheme: const SwitchThemeData(
        trackOutlineColor: WidgetStatePropertyAll(ColorManager.blue),
        thumbColor: WidgetStatePropertyAll(ColorManager.white),
        trackColor: WidgetStatePropertyAll(ColorManager.blue),
        thumbIcon: WidgetStatePropertyAll(Icon(
          Icons.light_mode,
          color: ColorManager.white,
        )),
      ),
      fontFamily: FontFamilyManager.inter,
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorManager.white,
      //-----------------------------------------------------------//* APP BAR
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: ColorManager.blue,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: ColorManager.blue,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        iconTheme: const IconThemeData(color: ColorManager.blue),
        elevation: 0,
        shadowColor: ColorManager.blue.withOpacity(0.3),
      ),

      //-----------------------------------------------------------//* TEXT
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 23.sp,
          color: ColorManager.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 15.sp,
          color: ColorManager.blue,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          color: ColorManager.black,
          fontWeight: FontWeight.w400,
        ),

        displayLarge: TextStyle(
          fontSize: 24.sp,
          color: ColorManager.grey,
          fontWeight: FontWeight.w400,
        ),
        //--------------------------------------------------//* For button
        displayMedium: TextStyle(
          fontSize: 15.sp,
          color: ColorManager.white,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(

          color: ColorManager.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      //--------------------------------------------------//* INPUT DECORATION
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(fontSize: 0),
        hintStyle: TextStyle(fontSize: 12.sp, fontFamily: FontFamilyManager.inter),
        filled: true,
        fillColor: ColorManager.white,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide:BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide.none),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            width: 1.5,
            color: ColorManager.error,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            width: 1.5,
            color: ColorManager.error,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15),
      ),
    );
  }
}
