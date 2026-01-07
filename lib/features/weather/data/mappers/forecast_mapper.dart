import 'package:intl/intl.dart';
import 'package:take_home_task/features/weather/data/models/forecast_response_dto.dart';
import 'package:take_home_task/features/weather/domain/models/forecast_day_entity.dart';
import 'package:take_home_task/features/weather/domain/models/forecast_response_entity.dart';

extension ForecastMapper on ForecastResponseDto {
  ForecastResponseEntity toEntity() {
    // Group forecast items by date
    Map<String, List<dynamic>> groupedByDate = {};

    for (var item in list) {
      final date = item.dtTxt.split(' ')[0]; // Extract date (YYYY-MM-DD)

      if (!groupedByDate.containsKey(date)) {
        groupedByDate[date] = [];
      }

      groupedByDate[date]!.add({
        'temp': item.main.temp,
        'condition': item.weather.first.main,
        'description': item.weather.first.description,
        'icon': item.weather.first.icon,
      });
    }

    // Process each day to get high/low temps
    List<ForecastDayEntity> dailyForecasts = [];

    groupedByDate.forEach((date, items) {
      if (dailyForecasts.length >= 5) return; // Only get 5 days

      // Find high and low temps
      double highTemp = items
          .map((e) => e['temp'] as double)
          .reduce((a, b) => a > b ? a : b);
      double lowTemp = items
          .map((e) => e['temp'] as double)
          .reduce((a, b) => a < b ? a : b);

      // Get most common weather condition
      Map<String, int> conditionCount = {};
      for (var item in items) {
        String condition = item['condition'];
        conditionCount[condition] = (conditionCount[condition] ?? 0) + 1;
      }
      String mostCommonCondition = conditionCount.entries
          .reduce((a, b) => a.value > b.value ? a : b)
          .key;

      // Get corresponding icon
      String icon = items.firstWhere(
        (e) => e['condition'] == mostCommonCondition,
      )['icon'];

      // Format day name
      DateTime dateTime = DateTime.parse(date);
      String dayName = DateFormat('EEEE').format(dateTime);

      dailyForecasts.add(
        ForecastDayEntity(
          date: date,
          dayName: dayName,
          highTemp: highTemp,
          lowTemp: lowTemp,
          condition: mostCommonCondition,
          icon: icon,
        ),
      );
    });

    return ForecastResponseEntity(dailyForecasts: dailyForecasts);
  }
}
