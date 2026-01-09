import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:take_home_task/config/base_response/base_response.dart';
import 'package:take_home_task/config/error_handler/error_handler.dart';
import 'package:take_home_task/core/constants/api_constants.dart';
import 'package:take_home_task/features/home/data/datasources/local/home_local_data_source_contract.dart';
import 'package:take_home_task/features/home/domain/repositories/home_repo_contract.dart';

@Injectable(as: HomeRepoContract)
class HomeRepoImpl implements HomeRepoContract {
  final HomeLocalDataSourceContract _dataSource;

  HomeRepoImpl(this._dataSource);

  @override
  Future<BaseResponse<List<String>>> getFavoriteCities() async {
    final response = await _dataSource.getFavoriteCities();
    return response.when(
      success: (data) => BaseResponse<List<String>>.success(data),
      failure: (error) => BaseResponse<List<String>>.failure(error),
    );
  }

  @override
  Future<BaseResponse<bool>> addFavorite(String cityName) async {
    final trimmedCity = cityName.trim();

    if (trimmedCity.isEmpty) {
      return BaseResponse<bool>.failure(
        ErrorHandler.handle(Exception('City name cannot be empty')),
      );
    }

    final favoritesResponse = await _dataSource.getFavoriteCities();

    return favoritesResponse.when(
      success: (favoritesList) {
        if (favoritesList.contains(trimmedCity)) {
          return BaseResponse<bool>.failure(
            ErrorHandler.handle(Exception('City already exists')),
          );
        }

        if (favoritesList.length >= ApiConstants.maxFavorites) {
          return BaseResponse<bool>.failure(
            ErrorHandler.handle(
              Exception(
                'Maximum ${ApiConstants.maxFavorites} favorites reached',
              ),
            ),
          );
        }

        return _dataSource.addFavorite(trimmedCity);
      },
      failure: (error) {
        return BaseResponse<bool>.failure(error);
      },
    );
  }

  @override
  Future<BaseResponse<bool>> removeFavorite(String cityName) async {
    final trimmedCity = cityName.trim();

    if (trimmedCity.isEmpty) {
      return BaseResponse<bool>.failure(
        ErrorHandler.handle(Exception('City name cannot be empty')),
      );
    }

    final favoritesResponse = await _dataSource.getFavoriteCities();

    return favoritesResponse.when(
      success: (favoritesList) {
        if (!favoritesList.contains(trimmedCity)) {
          return BaseResponse<bool>.failure(
            ErrorHandler.handle(Exception('City not found in favorites')),
          );
        }

        return _dataSource.removeFavorite(trimmedCity);
      },
      failure: (error) {
        return BaseResponse<bool>.failure(error);
      },
    );
  }

  @override
  Future<BaseResponse<bool>> isFavorite(String cityName) async {
    final trimmedCity = cityName.trim();
    final favoritesResponse = await _dataSource.getFavoriteCities();

    return favoritesResponse.when(
      success: (favoritesList) {
        return BaseResponse<bool>.success(favoritesList.contains(trimmedCity));
      },
      failure: (error) {
        return BaseResponse<bool>.failure(error);
      },
    );
  }

  @override
  Future<BaseResponse<int>> getFavoritesCount() async {
    final favoritesResponse = await _dataSource.getFavoriteCities();

    return favoritesResponse.when(
      success: (favoritesList) {
        return BaseResponse<int>.success(favoritesList.length);
      },
      failure: (error) {
        return BaseResponse<int>.failure(error);
      },
    );
  }

  @override
  Future<BaseResponse<bool>> canAddMore() async {
    final favoritesResponse = await _dataSource.getFavoriteCities();

    return favoritesResponse.when(
      success: (favoritesList) {
        return BaseResponse<bool>.success(
          favoritesList.length < ApiConstants.maxFavorites,
        );
      },
      failure: (error) {
        return BaseResponse<bool>.failure(error);
      },
    );
  }

  @override
  Future<BaseResponse<void>> clearAllFavorites() async {
    try {
      final box = Hive.box(ApiConstants.favoritesBox);
      await box.delete(ApiConstants.favoritesKey);
      return BaseResponse<void>.success(null);
    } catch (e) {
      return BaseResponse<void>.failure(ErrorHandler.handle(e));
    }
  }
}
