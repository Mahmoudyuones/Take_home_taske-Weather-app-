import 'package:take_home_task/features/weather/data/models/weather_dto.dart';
import 'package:take_home_task/features/weather/domain/entities/weather_entity.dart';

extension WeatherMapper on WeatherDto {
  WeatherEntity toEntity() {
    return WeatherEntity(
      id: id,
      main: main,
      description: description,
      icon: icon,
    );
  }
}
