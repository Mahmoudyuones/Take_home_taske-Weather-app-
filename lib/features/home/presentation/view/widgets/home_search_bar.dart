import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_task/core/constants/app_routes_constants.dart';
import 'package:take_home_task/core/constants/app_text_constants.dart';
import 'package:take_home_task/core/theme/app_colors.dart';
import 'package:take_home_task/core/theme/app_theme.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = AppTheme.appTheme.textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: screenWidth * 0.03,
            offset: Offset(0, screenHeight * 0.005),
          ),
        ],
      ),
      child: TextField(
        style: textTheme.bodySmall?.copyWith(
          fontSize: screenWidth * (14 / 375),
          color: AppColors.forecastDayText,
        ),
        decoration: InputDecoration(
          hintText: AppTextConstants.searchCity,
          hintStyle: textTheme.labelSmall?.copyWith(
            fontSize: screenWidth * (14 / 375),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.forecastConditionText,
            size: screenWidth * 0.06,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.018,
          ),
        ),
        onSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            context.push(
              AppRoutesConstants.weather,
              extra: {AppRoutesConstants.cityName: value.trim()},
            );
          }
        },
      ),
    );
  }
}
