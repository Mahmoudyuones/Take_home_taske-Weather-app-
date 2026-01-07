import 'package:json_annotation/json_annotation.dart';

part 'wind_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class WindDto {
  @JsonKey(name: 'speed')
  final double speed;

  @JsonKey(name: 'deg')
  final int deg;

  @JsonKey(name: 'gust')
  final double? gust; // Make this nullable

  WindDto({
    required this.speed,
    required this.deg,
    this.gust, // Optional
  });

  factory WindDto.fromJson(Map<String, dynamic> json) =>
      _$WindDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WindDtoToJson(this);
}
