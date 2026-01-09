import 'package:take_home_task/config/base_response/base_response.dart';

abstract class HomeLocalDataSourceContract {
  Future<BaseResponse<List<String>>> getFavoriteCities();
  Future<BaseResponse<bool>> addFavorite(String cityName);
  Future<BaseResponse<bool>> removeFavorite(String cityName);
}
