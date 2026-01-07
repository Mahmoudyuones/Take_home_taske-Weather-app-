import 'package:json_annotation/json_annotation.dart';

part 'main_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class MainDto {
  @JsonKey(name: 'temp')
  final double temp;

  @JsonKey(name: 'feels_like')
  final double feelsLike;

  @JsonKey(name: 'temp_min')
  final double tempMin;

  @JsonKey(name: 'temp_max')
  final double tempMax;

  @JsonKey(name: 'pressure')
  final int pressure;

  @JsonKey(name: 'humidity')
  final int humidity;

  @JsonKey(name: 'sea_level')
  final int? seaLevel; // Make nullable

  @JsonKey(name: 'grnd_level')
  final int? grndLevel; // Make nullable

  MainDto({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory MainDto.fromJson(Map<String, dynamic> json) =>
      _$MainDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MainDtoToJson(this);
}
