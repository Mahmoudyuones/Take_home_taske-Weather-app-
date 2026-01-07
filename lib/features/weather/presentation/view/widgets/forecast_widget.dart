import 'package:flutter/material.dart';
import 'package:take_home_task/core/theme/app_colors.dart';
import 'package:take_home_task/features/weather/domain/entities/forecast_response_entity.dart';
import 'package:take_home_task/features/weather/presentation/view/widgets/forecast_item_widget.dart';

class ForecastWidget extends StatelessWidget {
  final ForecastResponseEntity forecastData;

  const ForecastWidget({super.key, required this.forecastData});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: AppColors.forecastWidgetBackground.withOpacity(0.85),
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.02),
          ...forecastData.dailyForecasts.map(
            (forecast) => ForecastItemWidget(
              condition: forecast.condition,
              dayName: forecast.dayName,
              highTemp: forecast.highTemp,
              lowTemp: forecast.lowTemp,
            ),
          ),
        ],
      ),
    );
  }
}
