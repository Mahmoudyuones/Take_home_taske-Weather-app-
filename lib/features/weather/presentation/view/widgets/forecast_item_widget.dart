import 'package:flutter/widgets.dart';
import 'package:take_home_task/core/theme/app_colors.dart';
import 'package:take_home_task/core/theme/app_theme.dart';
import 'package:take_home_task/features/weather/presentation/view/widgets/weather_icon_widget.dart';

class ForecastItemWidget extends StatelessWidget {
  final String condition;
  final String dayName;
  final dynamic highTemp;
  final dynamic lowTemp;

  const ForecastItemWidget({
    super.key,
    required this.condition,
    required this.dayName,
    required this.highTemp,
    required this.lowTemp,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = AppTheme.appTheme.textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.015),
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: AppColors.forecastItemBackground,
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              dayName,
              style: textTheme.bodySmall?.copyWith(
                fontSize: screenWidth * (14 / 375),
              ),
            ),
          ),

          WeatherIconWidget(
            condition: condition,
            color: AppColors.primaryColor,
            size: screenWidth * 0.07,
          ),
          SizedBox(width: screenWidth * 0.03),

          Expanded(
            flex: 2,
            child: Text(
              condition,
              style: textTheme.labelSmall?.copyWith(
                fontSize: screenWidth * (13 / 375),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: screenWidth * 0.03),

          Row(
            children: [
              Text(
                '${highTemp.round()}°',
                style: textTheme.titleMedium?.copyWith(
                  fontSize: screenWidth * (16 / 375),
                ),
              ),
              SizedBox(width: screenWidth * 0.01),
              Text(
                '${lowTemp.round()}°',
                style: textTheme.titleSmall?.copyWith(
                  fontSize: screenWidth * (16 / 375),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
