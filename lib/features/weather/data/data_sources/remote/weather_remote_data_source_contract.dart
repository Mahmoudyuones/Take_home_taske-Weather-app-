import 'package:take_home_task/config/base_response/base_response.dart';
import 'package:take_home_task/features/weather/data/models/forecast_response_dto.dart';
import 'package:take_home_task/features/weather/data/models/weather_response_dto.dart';

abstract class WeatherRemoteDataSourceContract {
  Future<BaseResponse<WeatherResponseDto>> getCurrentCityWeather({
    required double lat,
    required double lon,
  });
  Future<BaseResponse<ForecastResponseDto>> getCurrentCityForcaset({
    required double lat,
    required double lon,
  });
}
