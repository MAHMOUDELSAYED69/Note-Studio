import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/font_family.dart';

abstract class AppTheme {
  //!! dark THEME
  static ThemeData get darkTheme {
    return ThemeData(
      cardColor: ColorManager.darkGrey,
      primaryColor: ColorManager.dark,
      canvasColor: ColorManager.grey,
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
        ),
      ),

      //-----------------------------------------------------------//* Floating Action Button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: ColorManager.white,
          backgroundColor: ColorManager.dark,
          shape: CircleBorder(),
          splashColor: ColorManager.transparent),
      //-----------------------------------------------------------//* Icon
      iconTheme: const IconThemeData(color: ColorManager.white, size: 25),

      fontFamily: FontFamilyManager.nunito,
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorManager.dark,
      //-----------------------------------------------------------//* APP BAR
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: ColorManager.white,
            fontSize: 37.sp,
            fontFamily: FontFamilyManager.nunito),
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
          fontSize: 30.sp,
          color: ColorManager.white,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontSize: 17.5.sp,
          color: ColorManager.white,
          fontWeight: FontWeight.w300,
        ),
        bodySmall: TextStyle(
          fontSize: 14.sp,
          color: ColorManager.white,
          fontWeight: FontWeight.w400,
        ),

        displayLarge: TextStyle(
          fontSize: 45.2.sp,
          color: ColorManager.lightGrey,
        ),
        //--------------------------------------------------//* For button
        displayMedium: TextStyle(
          fontSize: 21.sp,
          color: ColorManager.lightGrey,
        ),
      ),

      textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorManager.lightGrey,
          selectionColor: ColorManager.darkGrey.withOpacity(0.7),
          selectionHandleColor: ColorManager.darkGrey),

      //--------------------------------------------------//* INPUT DECORATION Text Field
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
      //--------------------------------------------------//* Search Bar
    );
  }

  //?? light THEME
  static ThemeData get lightTheme {
    return ThemeData(
      cardColor: ColorManager.lightGrey,
      primaryColor: ColorManager.lightGrey,
      canvasColor: ColorManager.dark,

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
        ),
      ),

      //-----------------------------------------------------------//* Floating Action Button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: ColorManager.dark,
          backgroundColor: ColorManager.white,
          shape: CircleBorder(),
          splashColor: ColorManager.transparent),
      //-----------------------------------------------------------//* Icon
      iconTheme: const IconThemeData(color: ColorManager.dark, size: 25),
      fontFamily: FontFamilyManager.nunito,
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorManager.white,
      //-----------------------------------------------------------//* APP BAR
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: ColorManager.dark,
            fontSize: 37.sp,
            fontFamily: FontFamilyManager.nunito),
        backgroundColor: ColorManager.transparent,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        iconTheme: const IconThemeData(color: ColorManager.dark),
        elevation: 0,
      ),

      //-----------------------------------------------------------//* TEXT
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 30.sp,
          color: ColorManager.dark,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontSize: 17.5.sp,
          color: ColorManager.dark,
          fontWeight: FontWeight.w300,
        ),
        bodySmall: TextStyle(
          fontSize: 14.sp,
          color: ColorManager.dark,
          fontWeight: FontWeight.w400,
        ),

        displayLarge: TextStyle(
          fontSize: 45.2.sp,
          color: ColorManager.darkGrey,
        ),
        //--------------------------------------------------//* For button
        displayMedium: TextStyle(
          fontSize: 21.sp,
          color: ColorManager.darkGrey,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorManager.darkGrey,
          selectionColor: ColorManager.lightGrey.withOpacity(0.7),
          selectionHandleColor: ColorManager.lightGrey),

      //--------------------------------------------------//* INPUT DECORATION Text Field
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
      //--------------------------------------------------//* Search Bar
    );
  }
}
