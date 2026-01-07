class ForecastDayEntity {
  final String date;
  final String dayName;
  final double highTemp;
  final double lowTemp;
  final String condition;
  final String icon;

  ForecastDayEntity({
    required this.date,
    required this.dayName,
    required this.highTemp,
    required this.lowTemp,
    required this.condition,
    required this.icon,
  });
}
