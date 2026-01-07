import 'package:injectable/injectable.dart';
import 'package:take_home_task/config/base_response/base_response.dart';
import 'package:take_home_task/features/weather/data/data_sources/remote/weather_remote_data_source_contract.dart';
import 'package:take_home_task/features/weather/data/mappers/forecast_mapper.dart';
import 'package:take_home_task/features/weather/data/mappers/weather_response_mapper.dart';
import 'package:take_home_task/features/weather/domain/models/forecast_response_entity.dart';
import 'package:take_home_task/features/weather/domain/models/weather_response_entity.dart';
import 'package:take_home_task/features/weather/domain/repo/weather_repo_contract.dart';

@Injectable(as: WeatherRepoContract)
class WeatherRepoImpl implements WeatherRepoContract {
  final WeatherRemoteDataSourceContract _dataSource;

  WeatherRepoImpl(this._dataSource);
  @override
  Future<BaseResponse<WeatherResponseEntity>> getWeatherByLocation(
    double lat,
    double lon,
  ) async {
    final response = await _dataSource.getCurrentCityWeather(
      lat: lat,
      lon: lon,
    );
    return response.when(
      success: (dto) {
        final WeatherResponseEntity entity = dto.toEntity();
        return BaseResponse<WeatherResponseEntity>.success(entity);
      },
      failure: (errorhandeler) {
        return BaseResponse<WeatherResponseEntity>.failure(errorhandeler);
      },
    );
  }

  @override
  Future<BaseResponse<ForecastResponseEntity>> getForecastByLocation(
    double lat,
    double lon,
  ) async {
    final response = await _dataSource.getCurrentCityForcaset(
      lat: lat,
      lon: lon,
    );
    return response.when(
      success: (dto) {
        final ForecastResponseEntity entity = dto.toEntity();
        return BaseResponse<ForecastResponseEntity>.success(entity);
      },
      failure: (errorhandeler) {
        return BaseResponse<ForecastResponseEntity>.failure(errorhandeler);
      },
    );
  }
}
