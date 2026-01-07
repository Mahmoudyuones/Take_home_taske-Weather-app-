import 'package:take_home_task/features/weather/data/models/sys_dto.dart';
import 'package:take_home_task/features/weather/domain/entities/sys_entity.dart';

extension SysMapper on SysDto {
  SysEntity toEntity() {
    return SysEntity(
      type: type,
      id: id,
      country: country,
      sunrise: sunrise,
      sunset: sunset,
    );
  }
}
