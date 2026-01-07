// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_list_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastListItemDto _$ForecastListItemDtoFromJson(Map<String, dynamic> json) =>
    ForecastListItemDto(
      dt: (json['dt'] as num).toInt(),
      main: MainDto.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: CloudsDto.fromJson(json['clouds'] as Map<String, dynamic>),
      wind: WindDto.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num).toInt(),
      pop: (json['pop'] as num).toDouble(),
      dtTxt: json['dt_txt'] as String,
    );

Map<String, dynamic> _$ForecastListItemDtoToJson(
  ForecastListItemDto instance,
) => <String, dynamic>{
  'dt': instance.dt,
  'main': instance.main.toJson(),
  'weather': instance.weather.map((e) => e.toJson()).toList(),
  'clouds': instance.clouds.toJson(),
  'wind': instance.wind.toJson(),
  'visibility': instance.visibility,
  'pop': instance.pop,
  'dt_txt': instance.dtTxt,
};
