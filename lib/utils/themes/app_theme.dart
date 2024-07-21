import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/font_family.dart';

abstract class AppTheme {
  //!! dark THEME
  static ThemeData get darkTheme {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          overlayColor:
              WidgetStatePropertyAll(ColorManager.white.withOpacity(0.2)),
          foregroundColor: const WidgetStatePropertyAll(ColorManager.white),
          backgroundColor: const WidgetStatePropertyAll(ColorManager.green),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          fixedSize: WidgetStatePropertyAll(
            Size(double.maxFinite, 48.h),
          ),
        ),
      ),

      checkboxTheme: CheckboxThemeData(
        checkColor: const WidgetStatePropertyAll(ColorManager.white),
        fillColor: const WidgetStatePropertyAll(ColorManager.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.dm),
        ),
        side: BorderSide(color: ColorManager.grey, width: 1.dm),
      ),
      //

      iconTheme: const IconThemeData(color: ColorManager.dark),
      switchTheme: const SwitchThemeData(
        trackOutlineColor: WidgetStatePropertyAll(ColorManager.green),
        thumbColor: WidgetStatePropertyAll(ColorManager.white),
        trackColor: WidgetStatePropertyAll(ColorManager.green),
        thumbIcon: WidgetStatePropertyAll(Icon(
          Icons.dark_mode,
          color: ColorManager.white,
        )),
      ),
      fontFamily: FontFamilyManager.ubuntu,
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorManager.dark,
      //-----------------------------------------------------------//* APP BAR
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: ColorManager.dark,
          fontSize: 20.spMin,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: ColorManager.transparent,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        iconTheme: const IconThemeData(color: ColorManager.dark),
        elevation: 0,
        shadowColor: ColorManager.dark.withOpacity(0.3),
      ),

      //-----------------------------------------------------------//* TEXT
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 70.sp,
          color: ColorManager.white,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontSize: 16.spMin,
          color: ColorManager.grey,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: 14.spMin,
          color: ColorManager.white,
          fontWeight: FontWeight.w400,
        ),

        displayLarge: TextStyle(
          fontSize: 24.spMin,
          color: ColorManager.grey,
          fontWeight: FontWeight.w600,
        ),
        //--------------------------------------------------//* For button
        displayMedium: TextStyle(
          fontSize: 16.spMin,
          color: ColorManager.lightGreen,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: ColorManager.green,
          color: ColorManager.green,
          fontSize: 14.spMin,
          fontWeight: FontWeight.w500,
        ),
      ),
      //--------------------------------------------------//* INPUT DECORATION
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 14.spMin),
        filled: true,
        fillColor: ColorManager.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            width: 1.7.w,
            color: ColorManager.green,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            width: 1.7.w,
            color: ColorManager.green,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            width: 2.w,
            color: ColorManager.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            width: 2.w,
            color: ColorManager.red,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20),
      ),
    );
  }
}
