import 'package:take_home_task/features/weather/data/models/main_dto.dart';
import 'package:take_home_task/features/weather/domain/models/main_entity.dart';

extension MainMapper on MainDto {
  MainEntity toEntity() {
    return MainEntity(
      temp: temp,
      feelsLike: feelsLike,
      tempMin: tempMin,
      tempMax: tempMax,
      pressure: pressure,
      humidity: humidity,
      seaLevel: seaLevel,
      grndLevel: grndLevel,
    );
  }
}
