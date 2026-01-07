import 'package:take_home_task/features/weather/data/mappers/clouds_mapper.dart';
import 'package:take_home_task/features/weather/data/mappers/coord_mapper.dart';
import 'package:take_home_task/features/weather/data/mappers/main_mapper.dart';
import 'package:take_home_task/features/weather/data/mappers/sys_mapper.dart';
import 'package:take_home_task/features/weather/data/mappers/weather_mapper.dart';
import 'package:take_home_task/features/weather/data/mappers/wind_mapper.dart';
import 'package:take_home_task/features/weather/data/models/weather_response_dto.dart';
import 'package:take_home_task/features/weather/domain/models/weather_response_entity.dart';

extension WeatherResponseMapper on WeatherResponseDto {
  WeatherResponseEntity toEntity() {
    return WeatherResponseEntity(
      coord: coord.toEntity(),
      weather: weather.map((w) => w.toEntity()).toList(),
      base: base,
      main: main.toEntity(),
      visibility: visibility,
      wind: wind.toEntity(),
      clouds: clouds.toEntity(),
      dt: dt,
      sys: sys.toEntity(),
      timezone: timezone,
      id: id,
      name: name,
      cod: cod,
    );
  }
}
