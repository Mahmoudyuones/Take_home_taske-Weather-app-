import 'package:take_home_task/features/weather/domain/entities/forecast_day_entity.dart';

class ForecastResponseEntity {
  final List<ForecastDayEntity> dailyForecasts;

  ForecastResponseEntity({required this.dailyForecasts});
}
