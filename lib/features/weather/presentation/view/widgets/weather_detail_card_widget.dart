import 'package:flutter/material.dart';
import 'package:take_home_task/core/theme/app_theme.dart';

class WeatherDetailCardWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherDetailCardWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = AppTheme.appTheme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFDBEAFE),
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
      ),
      padding: EdgeInsets.all(screenWidth * 0.03),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFBFDBFE),
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
            ),
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Icon(
              icon,
              color: Color(0xFF2563EB),
              size: screenWidth * 0.05,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              fontSize: screenWidth * (11 / 375),
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            value,
            style: textTheme.titleMedium?.copyWith(
              fontSize: screenWidth * (18 / 375),
            ),
          ),
        ],
      ),
    );
  }
}
