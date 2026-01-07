import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:take_home_task/core/constants/api_constants.dart';
import 'package:take_home_task/features/weather/data/models/forecast_response_dto.dart';
import 'package:take_home_task/features/weather/data/models/weather_response_dto.dart';

part 'api_client.g.dart';

@RestApi()
@Injectable()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;
  @GET(ApiConstants.weatherEndpoint)
  Future<WeatherResponseDto> getWeatherByLocation(
    @Query('lat') double lat,
    @Query('lon') double lon,
    @Query('appid') String apiKey,
    @Query('units') String units,
  );
  @GET(ApiConstants.forecastEndpoint)
  Future<ForecastResponseDto> getForecastByLocation(
    @Query("lat") double latitude,
    @Query("lon") double longitude,
    @Query("appid") String apiKey,
    @Query("units") String units,
  );
  @GET(ApiConstants.weatherEndpoint)
  Future<WeatherResponseDto> getWeatherByCity(
    @Query('q') String cityName,
    @Query('appid') String apiKey,
    @Query('units') String units,
  );
  @GET(ApiConstants.forecastEndpoint)
  Future<ForecastResponseDto> getForecastByCity(
    @Query('q') String cityName,
    @Query('appid') String apiKey,
    @Query('units') String units,
  );
}
