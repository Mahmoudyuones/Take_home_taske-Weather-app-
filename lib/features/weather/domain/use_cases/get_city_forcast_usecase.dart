import 'package:injectable/injectable.dart';
import 'package:take_home_task/features/weather/domain/repo/weather_repo_contract.dart';

@injectable
class GetCityForcastUsecase {
  final WeatherRepoContract _weatherRepository;

  GetCityForcastUsecase(this._weatherRepository);

  Future call(String cityName) async {
    return await _weatherRepository.getForecastByCity(cityName);
  }
}
