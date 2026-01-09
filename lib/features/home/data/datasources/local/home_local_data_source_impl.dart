import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:take_home_task/config/base_response/base_response.dart';
import 'package:take_home_task/config/error_handler/error_handler.dart';
import 'package:take_home_task/core/constants/api_constants.dart';
import 'package:take_home_task/features/home/data/datasources/local/home_local_data_source_contract.dart';

@Injectable(as: HomeLocalDataSourceContract)
class HomeLocalDataSourceImpl implements HomeLocalDataSourceContract {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(ApiConstants.favoritesBox);
  }

  Box _getBox() {
    return Hive.box(ApiConstants.favoritesBox);
  }

  @override
  Future<BaseResponse<List<String>>> getFavoriteCities() async {
    try {
      final box = _getBox();
      final favorites = box.get(
        ApiConstants.favoritesKey,
        defaultValue: <String>[],
      );
      return BaseResponse<List<String>>.success(List<String>.from(favorites));
    } catch (e) {
      return BaseResponse<List<String>>.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<bool>> addFavorite(String cityName) async {
    try {
      final box = _getBox();
      final favoritesResponse = await getFavoriteCities();

      return favoritesResponse.when(
        success: (favoritesList) {
          favoritesList.add(cityName);
          box.put(ApiConstants.favoritesKey, favoritesList);
          return BaseResponse<bool>.success(true);
        },
        failure: (error) {
          return BaseResponse<bool>.failure(error);
        },
      );
    } catch (e) {
      return BaseResponse<bool>.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<BaseResponse<bool>> removeFavorite(String cityName) async {
    try {
      final box = _getBox();
      final favoritesResponse = await getFavoriteCities();

      return favoritesResponse.when(
        success: (favoritesList) {
          favoritesList.remove(cityName);
          box.put(ApiConstants.favoritesKey, favoritesList);
          return BaseResponse<bool>.success(true);
        },
        failure: (error) {
          return BaseResponse<bool>.failure(error);
        },
      );
    } catch (e) {
      return BaseResponse<bool>.failure(ErrorHandler.handle(e));
    }
  }
}
