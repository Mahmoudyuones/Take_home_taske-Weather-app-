// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponseDto _$ForecastResponseDtoFromJson(Map<String, dynamic> json) =>
    ForecastResponseDto(
      cod: json['cod'] as String,
      message: (json['message'] as num).toInt(),
      cnt: (json['cnt'] as num).toInt(),
      list: (json['list'] as List<dynamic>)
          .map((e) => ForecastListItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastResponseDtoToJson(
  ForecastResponseDto instance,
) => <String, dynamic>{
  'cod': instance.cod,
  'message': instance.message,
  'cnt': instance.cnt,
  'list': instance.list.map((e) => e.toJson()).toList(),
};
