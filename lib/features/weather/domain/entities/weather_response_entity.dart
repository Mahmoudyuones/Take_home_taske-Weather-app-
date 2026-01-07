import 'package:take_home_task/features/weather/domain/entities/clouds_entity.dart';
import 'package:take_home_task/features/weather/domain/entities/coord_entity.dart';
import 'package:take_home_task/features/weather/domain/entities/main_entity.dart';
import 'package:take_home_task/features/weather/domain/entities/sys_entity.dart';
import 'package:take_home_task/features/weather/domain/entities/weather_entity.dart';
import 'package:take_home_task/features/weather/domain/entities/wind_entity.dart';

class WeatherResponseEntity {
  final CoordEntity coord;
  final List<WeatherEntity> weather;
  final String base;
  final MainEntity main;
  final int visibility;
  final WindEntity wind;
  final CloudsEntity clouds;
  final int dt;
  final SysEntity sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherResponseEntity({
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
}
