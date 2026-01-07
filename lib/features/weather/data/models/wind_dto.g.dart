// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindDto _$WindDtoFromJson(Map<String, dynamic> json) => WindDto(
  speed: (json['speed'] as num).toDouble(),
  deg: (json['deg'] as num).toInt(),
  gust: (json['gust'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WindDtoToJson(WindDto instance) => <String, dynamic>{
  'speed': instance.speed,
  'deg': instance.deg,
  'gust': instance.gust,
};
