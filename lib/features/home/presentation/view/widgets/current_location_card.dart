import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_task/core/constants/app_routes_constants.dart';
import 'package:take_home_task/core/constants/app_text_constants.dart';
import 'package:take_home_task/core/theme/app_colors.dart';
import 'package:take_home_task/core/theme/app_theme.dart';

class CurrentLocationCard extends StatelessWidget {
  const CurrentLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = AppTheme.appTheme.textTheme;

    return GestureDetector(
      onTap: () {
        context.pushReplacement(AppRoutesConstants.weather);
      },
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.primaryColor.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        child: Row(
          children: [
            const Icon(Icons.my_location, color: AppColors.white),
            SizedBox(width: screenWidth * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTextConstants.useCurrentLocation,
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppTextConstants.autoDetectLocation,
                  style: textTheme.bodySmall?.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
