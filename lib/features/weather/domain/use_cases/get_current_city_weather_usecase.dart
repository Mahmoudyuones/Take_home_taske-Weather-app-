import 'package:injectable/injectable.dart';
import 'package:take_home_task/config/base_response/base_response.dart';
import 'package:take_home_task/features/weather/domain/repo/weather_repo_contract.dart';

@injectable
class GetCurrentCityWeatherUsecase {
  final WeatherRepoContract _weatherRepo;
  GetCurrentCityWeatherUsecase(this._weatherRepo);

  Future<BaseResponse> call(double lat, double lon) =>
      _weatherRepo.getWeatherByLocation(lat, lon);
}
