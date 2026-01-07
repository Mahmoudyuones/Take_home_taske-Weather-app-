import 'package:json_annotation/json_annotation.dart';

part 'sys_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class SysDto {
  @JsonKey(name: 'type')
  final int? type; // Make nullable

  @JsonKey(name: 'id')
  final int? id; // Make nullable

  @JsonKey(name: 'country')
  final String country;

  @JsonKey(name: 'sunrise')
  final int sunrise;

  @JsonKey(name: 'sunset')
  final int sunset;

  SysDto({
    this.type,
    this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SysDto.fromJson(Map<String, dynamic> json) => _$SysDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SysDtoToJson(this);
}
