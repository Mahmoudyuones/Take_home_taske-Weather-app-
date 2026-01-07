import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:take_home_task/config/base_response/base_response.dart';
import 'package:take_home_task/config/error_handler/error_handler.dart';
import 'package:take_home_task/core/constants/api_constants.dart';
import 'package:take_home_task/features/weather/api/api_client/api_client.dart';
import 'package:take_home_task/features/weather/data/data_sources/remote/weather_remote_data_source_contract.dart';
import 'package:take_home_task/features/weather/data/models/forecast_response_dto.dart';
import 'package:take_home_task/features/weather/data/models/weather_response_dto.dart';

@Injectable(as: WeatherRemoteDataSourceContract)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSourceContract {
  final ApiClient _apiClient;

  WeatherRemoteDataSourceImpl(this._apiClient);

  @override
  Future<BaseResponse<WeatherResponseDto>> getCurrentCityWeather({
    required double lat,
    required double lon,
  }) async {
    try {
      final WeatherResponseDto response = await _apiClient.getWeatherByLocation(
        lat,
        lon,
        ApiConstants.apiKey,
        'metric',
      );

      log('success getCurrentCityWeather api response: ${response.toJson()}');
      return BaseResponse<WeatherResponseDto>.success(response);
    } on TypeError catch (e, stackTrace) {
      log('Type error in API getCurrentCityWeather response: $e');
      log('Stack trace: $stackTrace');
      return BaseResponse<WeatherResponseDto>.failure(ErrorHandler.handle(e));
    } catch (e, stackTrace) {
      log('failed api getCurrentCityWeather response: $e');
      log('Stack trace: $stackTrace');
      return BaseResponse<WeatherResponseDto>.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<ForecastResponseDto>> getCurrentCityForcaset({
    required double lat,
    required double lon,
  }) async {
    try {
      final ForecastResponseDto response = await _apiClient
          .getForecastByLocation(lat, lon, ApiConstants.apiKey, 'metric');

      log('success api getCurrentCityForcaset response: ${response.toJson()}');
      return BaseResponse<ForecastResponseDto>.success(response);
    } on TypeError catch (e, stackTrace) {
      log('Type error in API getCurrentCityForcaset response: $e');
      log('Stack trace: $stackTrace');
      return BaseResponse<ForecastResponseDto>.failure(ErrorHandler.handle(e));
    } catch (e, stackTrace) {
      log('failed api getCurrentCityForcaset response: $e');
      log('Stack trace: $stackTrace');
      return BaseResponse<ForecastResponseDto>.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<WeatherResponseDto>> getCityWeather({
    required String cityName,
  }) async {
    try {
      final WeatherResponseDto response = await _apiClient.getWeatherByCity(
        cityName,
        ApiConstants.apiKey,
        'metric',
      );

      log('success getCurrentCityWeather api response: ${response.toJson()}');
      return BaseResponse<WeatherResponseDto>.success(response);
    } on TypeError catch (e, stackTrace) {
      log('Type error in API getCurrentCityWeather response: $e');
      log('Stack trace: $stackTrace');
      return BaseResponse<WeatherResponseDto>.failure(ErrorHandler.handle(e));
    } catch (e, stackTrace) {
      log('failed api getCurrentCityWeather response: $e');
      log('Stack trace: $stackTrace');
      return BaseResponse<WeatherResponseDto>.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<ForecastResponseDto>> getForcasetWeather({
    required String cityName,
  }) async {
    try {
      final ForecastResponseDto response = await _apiClient.getForecastByCity(
        cityName,
        ApiConstants.apiKey,
        'metric',
      );

      log('success api getCurrentCityForcaset response: ${response.toJson()}');
      return BaseResponse<ForecastResponseDto>.success(response);
    } on TypeError catch (e, stackTrace) {
      log('Type error in API getCurrentCityForcaset response: $e');
      log('Stack trace: $stackTrace');
      return BaseResponse<ForecastResponseDto>.failure(ErrorHandler.handle(e));
    } catch (e, stackTrace) {
      log('failed api getCurrentCityForcaset response: $e');
      log('Stack trace: $stackTrace');
      return BaseResponse<ForecastResponseDto>.failure(ErrorHandler.handle(e));
    }
  }
}
