import 'package:take_home_task/features/weather/data/models/coord_dto.dart';
import 'package:take_home_task/features/weather/domain/models/coord_entity.dart';

extension CoordMapper on CoordDto {
  CoordEntity toEntity() {
    return CoordEntity(lon: lon, lat: lat);
  }
}
