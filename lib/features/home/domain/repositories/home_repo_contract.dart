import 'package:take_home_task/config/base_response/base_response.dart';

abstract class HomeRepoContract {
  Future<BaseResponse<List<String>>> getFavoriteCities();

  Future<BaseResponse<bool>> addFavorite(String cityName);

  Future<BaseResponse<bool>> removeFavorite(String cityName);

  Future<BaseResponse<bool>> isFavorite(String cityName);

  Future<BaseResponse<int>> getFavoritesCount();

  Future<BaseResponse<bool>> canAddMore();

  Future<BaseResponse<void>> clearAllFavorites();
}
