abstract class WeatherEvents {}

class GetCurrenCityWeatherEvent extends WeatherEvents {}

class GetCurrenCityForcastEvent extends WeatherEvents {}

class GetCityWeatherEvent extends WeatherEvents {
  final String cityName;
  GetCityWeatherEvent(this.cityName);
}

class GetCityForecastEvent extends WeatherEvents {
  final String cityName;
  GetCityForecastEvent(this.cityName);
}
