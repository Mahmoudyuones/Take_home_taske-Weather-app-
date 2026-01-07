import 'package:json_annotation/json_annotation.dart';
import 'coord_dto.dart';
import 'weather_dto.dart';
import 'main_dto.dart';
import 'wind_dto.dart';
import 'clouds_dto.dart';
import 'sys_dto.dart';

part 'weather_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherResponseDto {
  @JsonKey(name: 'coord')
  final CoordDto coord;

  @JsonKey(name: 'weather')
  final List<WeatherDto> weather;

  @JsonKey(name: 'base')
  final String base;

  @JsonKey(name: 'main')
  final MainDto main;

  @JsonKey(name: 'visibility')
  final int visibility;

  @JsonKey(name: 'wind')
  final WindDto wind;

  @JsonKey(name: 'clouds')
  final CloudsDto clouds;

  @JsonKey(name: 'dt')
  final int dt;

  @JsonKey(name: 'sys')
  final SysDto sys;

  @JsonKey(name: 'timezone')
  final int timezone;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'cod')
  final int cod;

  WeatherResponseDto({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseDtoToJson(this);
}
