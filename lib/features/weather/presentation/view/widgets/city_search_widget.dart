import 'package:flutter/material.dart';
import 'package:take_home_task/core/theme/app_colors.dart';
import 'package:take_home_task/core/theme/app_theme.dart';

class CitySearchWidget extends StatelessWidget {
  final Function(String) onCitySelected;

  const CitySearchWidget({super.key, required this.onCitySelected});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = AppTheme.appTheme.textTheme;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.005,
      ),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(screenWidth * 0.08),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: screenWidth * 0.02,
            offset: Offset(0, screenHeight * 0.005),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppColors.forecastConditionText,
            size: screenWidth * 0.06,
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: TextField(
              style: textTheme.bodySmall?.copyWith(
                fontSize: screenWidth * (14 / 375),
                color: AppColors.forecastDayText,
              ),
              decoration: InputDecoration(
                hintText: 'Search for a city...',
                hintStyle: textTheme.labelSmall?.copyWith(
                  fontSize: screenWidth * (14 / 375),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,
                ),
              ),
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  onCitySelected(value.trim());
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.my_location,
              color: AppColors.primaryColor,
              size: screenWidth * 0.06,
            ),
            onPressed: () {
              onCitySelected(''); // Empty string means use current location
            },
            tooltip: 'Use current location',
          ),
        ],
      ),
    );
  }
}
