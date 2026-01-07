import 'package:flutter/widgets.dart';

abstract class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xFF3B82F6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Forecast Item Colors
  static const Color forecastItemBackground = Color(0xFFF3F4F6);
  static const Color forecastDayText = Color(0xFF1F2937);
  static const Color forecastConditionText = Color(0xFF6B7280);
  static const Color forecastTempText = Color(0xFF1F2937);
  static const Color forecastLowTempText = Color(0xFF9CA3AF);

  // Forecast Widget Colors
  static const Color forecastWidgetBackground = Color(0xFFFFFFFF);
  static const Color forecastWidgetShadow = Color(0xFF000000);

  // Error Colors
  static const Color errorRed = Color(0xFFFF0000);

  // Weather Widget Colors
  static const Color weatherConditionText = Color(0xFF4B5563);
  static const Color weatherDetailCardBackground = Color(0xFFDBEAFE);
  static const Color weatherDetailCardInnerBackground = Color(0xFFBFDBFE);
  static const Color weatherDetailCardIconColor = Color(0xFF2563EB);
}
