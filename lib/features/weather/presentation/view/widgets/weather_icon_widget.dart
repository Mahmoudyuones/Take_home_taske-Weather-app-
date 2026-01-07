import 'package:flutter/material.dart';

class WeatherIconWidget extends StatelessWidget {
  final String condition;
  final Color? color;
  final double? size;

  const WeatherIconWidget({
    super.key,
    required this.condition,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      switch (condition.toLowerCase()) {
        'clear' => Icons.wb_sunny,
        'clouds' => Icons.wb_cloudy,
        'rain' => Icons.grain,
        'drizzle' => Icons.grain,
        'thunderstorm' => Icons.flash_on,
        'snow' => Icons.ac_unit,
        'mist' || 'fog' => Icons.cloud,
        _ => Icons.wb_cloudy,
      },
      color: color,
      size: size,
    );
  }
}
