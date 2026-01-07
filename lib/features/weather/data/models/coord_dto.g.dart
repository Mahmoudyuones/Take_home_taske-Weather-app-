// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coord_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordDto _$CoordDtoFromJson(Map<String, dynamic> json) => CoordDto(
  lon: (json['lon'] as num).toDouble(),
  lat: (json['lat'] as num).toDouble(),
);

Map<String, dynamic> _$CoordDtoToJson(CoordDto instance) => <String, dynamic>{
  'lon': instance.lon,
  'lat': instance.lat,
};
