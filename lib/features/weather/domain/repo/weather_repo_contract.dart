import 'package:take_home_task/config/base_response/base_response.dart';
import 'package:take_home_task/features/weather/domain/entities/forecast_response_entity.dart';
import 'package:take_home_task/features/weather/domain/entities/weather_response_entity.dart';

abstract class WeatherRepoContract {
  Future<BaseResponse<WeatherResponseEntity>> getWeatherByLocation(
    double lat,
    double lon,
  );
  Future<BaseResponse<ForecastResponseEntity>> getForecastByLocation(
    double lat,
    double lon,
  );
  Future<BaseResponse<WeatherResponseEntity>> getWeatherByCity(String cityName);
  Future<BaseResponse<ForecastResponseEntity>> getForecastByCity(
    String cityName,
  );
}
