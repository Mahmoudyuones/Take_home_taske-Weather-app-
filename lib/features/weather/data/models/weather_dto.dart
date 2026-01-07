import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'main')
  final String main;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'icon')
  final String icon;

  WeatherDto({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);
}
