// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponseDto _$WeatherResponseDtoFromJson(Map<String, dynamic> json) =>
    WeatherResponseDto(
      coord: CoordDto.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String,
      main: MainDto.fromJson(json['main'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num).toInt(),
      wind: WindDto.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: CloudsDto.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: (json['dt'] as num).toInt(),
      sys: SysDto.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: (json['timezone'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      cod: (json['cod'] as num).toInt(),
    );

Map<String, dynamic> _$WeatherResponseDtoToJson(WeatherResponseDto instance) =>
    <String, dynamic>{
      'coord': instance.coord.toJson(),
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'base': instance.base,
      'main': instance.main.toJson(),
      'visibility': instance.visibility,
      'wind': instance.wind.toJson(),
      'clouds': instance.clouds.toJson(),
      'dt': instance.dt,
      'sys': instance.sys.toJson(),
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };
