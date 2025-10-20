import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/font_weight.dart';
import 'colors.dart';

abstract class AppTheme {
  static ThemeData getTheme(ColorScheme colorScheme) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: AppFontWeight.medium,
          color: AppColors.black,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          disabledBackgroundColor: AppColors.black[30],
          disabledForegroundColor: AppColors.white,
          backgroundColor: AppColors.blue[0],
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
          ),
          elevation: 0,
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: AppFontWeight.medium,
            color: AppColors.white,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: AppFontWeight.regular,
          color: AppColors.red,
        ),
        // contentPadding: const EdgeInsets.all(16),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: AppFontWeight.regular,
          color: AppColors.hintColor,
        ),
        prefixIconColor: AppColors.black[30],
        suffixIconColor: AppColors.black[30],
        labelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: AppFontWeight.medium,
          color: AppColors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.red),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.white,
      ),
      textTheme: TextTheme(
        bodySmall: TextStyle(
          fontWeight: AppFontWeight.regular,
          fontSize: 12.sp,
          color: AppColors.black[0],
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: AppFontWeight.regular,
          color: AppColors.hintColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: AppFontWeight.medium,
          color: AppColors.black,
        ),
        labelSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: AppFontWeight.regular,
          color: AppColors.red,
        ),
        labelMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.blue[70],
        ),
        labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: AppFontWeight.medium,
          color: AppColors.grey,
        ),
        headlineMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: AppFontWeight.medium,
          color: AppColors.black,
        ),
        titleLarge: TextStyle(
          fontSize: 16.sp,
          color: AppColors.black,
          fontWeight: AppFontWeight.regular,
        ),
        displayLarge: TextStyle(
          fontSize: 18.sp,
          fontWeight: AppFontWeight.medium,
          color: AppColors.black,
        ),
      ),
    );
  }

  static ThemeData lightTheme = getTheme(
    const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.blue,
      onPrimary: AppColors.white,
      secondary: AppColors.blue,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.blue,
      shadow: AppColors.black,
    ),
  );
}
