import 'package:take_home_task/features/weather/data/models/clouds_dto.dart';
import 'package:take_home_task/features/weather/domain/entities/clouds_entity.dart';

extension CloudsMapper on CloudsDto {
  CloudsEntity toEntity() {
    return CloudsEntity(all: all);
  }
}
