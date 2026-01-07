// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => WeatherDto(
  id: (json['id'] as num).toInt(),
  main: json['main'] as String,
  description: json['description'] as String,
  icon: json['icon'] as String,
);

Map<String, dynamic> _$WeatherDtoToJson(WeatherDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
