import 'package:take_home_task/config/base_state/base_state.dart';
import 'package:take_home_task/features/weather/domain/entities/forecast_response_entity.dart';
import 'package:take_home_task/features/weather/domain/entities/weather_response_entity.dart';

class WeatherStates {
  BaseState<WeatherResponseEntity>? weatherResponseEntity;
  BaseState<ForecastResponseEntity>? forecastResponseEntity;

  WeatherStates({this.weatherResponseEntity, this.forecastResponseEntity});
  WeatherStates copyWith({
    BaseState<WeatherResponseEntity>? weatherResponseEntity,
    BaseState<ForecastResponseEntity>? forecastResponseEntity,
  }) {
    return WeatherStates(
      weatherResponseEntity:
          weatherResponseEntity ?? this.weatherResponseEntity,
      forecastResponseEntity:
          forecastResponseEntity ?? this.forecastResponseEntity,
    );
  }
}
