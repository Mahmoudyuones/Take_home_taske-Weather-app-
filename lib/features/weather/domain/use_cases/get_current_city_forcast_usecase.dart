import 'package:injectable/injectable.dart';
import 'package:take_home_task/features/weather/domain/repo/weather_repo_contract.dart';

@injectable
class GetCurrentCityForcastUsecase {
  final WeatherRepoContract _weatherRepo;
  GetCurrentCityForcastUsecase(this._weatherRepo);

  Future call(double lat, double lon) =>
      _weatherRepo.getForecastByLocation(lat, lon);
}
