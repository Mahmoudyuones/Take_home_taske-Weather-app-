import 'package:json_annotation/json_annotation.dart';
import 'package:take_home_task/features/weather/data/models/forecast_list_item_dto.dart';

part 'forecast_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ForecastResponseDto {
  @JsonKey(name: 'cod')
  final String cod;

  @JsonKey(name: 'message')
  final int message;

  @JsonKey(name: 'cnt')
  final int cnt;

  @JsonKey(name: 'list')
  final List<ForecastListItemDto> list;

  ForecastResponseDto({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });

  factory ForecastResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastResponseDtoToJson(this);
}
