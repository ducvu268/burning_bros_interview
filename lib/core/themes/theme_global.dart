import 'package:burning_bros_interview/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class ThemeGlobal {
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: AppColors.primary,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      colorScheme:  ColorScheme.light(
        primary: Colors.white,
        onPrimary: AppColors.primary,
        surface: AppColors.primary,
        onSurface: Colors.white,
      ));
}
