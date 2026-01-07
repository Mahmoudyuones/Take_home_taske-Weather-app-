import 'package:json_annotation/json_annotation.dart';
import 'package:take_home_task/features/weather/data/models/main_dto.dart';
import 'package:take_home_task/features/weather/data/models/weather_dto.dart';
import 'package:take_home_task/features/weather/data/models/clouds_dto.dart';
import 'package:take_home_task/features/weather/data/models/wind_dto.dart';

part 'forecast_list_item_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ForecastListItemDto {
  @JsonKey(name: 'dt')
  final int dt;

  @JsonKey(name: 'main')
  final MainDto main;

  @JsonKey(name: 'weather')
  final List<WeatherDto> weather;

  @JsonKey(name: 'clouds')
  final CloudsDto clouds;

  @JsonKey(name: 'wind')
  final WindDto wind;

  @JsonKey(name: 'visibility')
  final int visibility;

  @JsonKey(name: 'pop')
  final double pop;

  @JsonKey(name: 'dt_txt')
  final String dtTxt;

  ForecastListItemDto({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.dtTxt,
  });

  factory ForecastListItemDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastListItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastListItemDtoToJson(this);
}
