import 'package:flutter/material.dart';
import 'package:take_home_task/core/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
        letterSpacing: 1.2,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xB3FFFFFF), // white70
      ),
      bodyMedium: TextStyle(fontSize: 16, color: AppColors.white),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.forecastDayText,
      ),
      labelSmall: TextStyle(
        fontSize: 13,
        color: AppColors.forecastConditionText,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.forecastTempText,
      ),
      titleSmall: TextStyle(fontSize: 16, color: AppColors.forecastLowTempText),
      labelMedium: TextStyle(
        fontSize: 14,
        color: AppColors.errorRed,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
