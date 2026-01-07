import 'package:flutter/material.dart';
import 'package:take_home_task/core/constants/app_text_constants.dart';
import 'package:take_home_task/core/theme/app_colors.dart';
import 'package:take_home_task/core/theme/app_theme.dart';
import 'package:take_home_task/features/weather/domain/models/weather_response_entity.dart';
import 'package:take_home_task/features/weather/presentation/view/widgets/weather_detail_card_widget.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherResponseEntity weatherData;

  const WeatherWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = AppTheme.appTheme.textTheme;

    final city = weatherData.name;
    final temperature = weatherData.main.temp.round();
    final feelsLike = weatherData.main.feelsLike.round();
    final condition = weatherData.weather.first.description;
    final humidity = weatherData.main.humidity;
    final windSpeed = weatherData.wind.speed.round();

    return Center(
      child: Padding(
        padding: EdgeInsets.zero,
        child: Container(
          constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.85),
            borderRadius: BorderRadius.circular(screenWidth * 0.06),
          ),
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                city,
                style: textTheme.headlineMedium?.copyWith(
                  fontSize: screenWidth * (24 / 375),
                  color: AppColors.forecastDayText,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                AppTextConstants.currentWeather,
                style: textTheme.labelSmall?.copyWith(
                  fontSize: screenWidth * (12 / 375),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Icon(
                Icons.wb_cloudy,
                size: screenWidth * 0.16,
                color: AppColors.primaryColor,
              ),
              SizedBox(height: screenHeight * 0.015),

              Text(
                '$temperature°C',
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: screenWidth * (48 / 375),
                  color: AppColors.forecastDayText,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),

              Text(
                condition,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: screenWidth * (16 / 375),
                  color: AppColors.weatherConditionText,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.thermostat,
                    size: screenWidth * 0.04,
                    color: AppColors.forecastConditionText,
                  ),
                  SizedBox(width: screenWidth * 0.015),
                  Text(
                    '${AppTextConstants.feelsLike} $feelsLike°C',
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: screenWidth * (13 / 375),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.025),

              Row(
                children: [
                  Expanded(
                    child: WeatherDetailCardWidget(
                      icon: Icons.water_drop,
                      label: AppTextConstants.humidity,
                      value: '$humidity%',
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),

                  Expanded(
                    child: WeatherDetailCardWidget(
                      icon: Icons.air,
                      label: AppTextConstants.wind,
                      value: '$windSpeed km/h',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
