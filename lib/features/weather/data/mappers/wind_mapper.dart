import 'package:take_home_task/features/weather/data/models/wind_dto.dart';
import 'package:take_home_task/features/weather/domain/entities/wind_entity.dart';

extension WindMapper on WindDto {
  WindEntity toEntity() {
    return WindEntity(speed: speed, deg: deg);
  }
}
