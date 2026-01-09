// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../core/services/location_service.dart' as _i752;
import '../../features/home/data/datasources/local/home_local_data_source_contract.dart'
    as _i874;
import '../../features/home/data/datasources/local/home_local_data_source_impl.dart'
    as _i295;
import '../../features/home/data/repositories/home_repo_impl.dart' as _i333;
import '../../features/home/domain/repositories/home_repo_contract.dart'
    as _i635;
import '../../features/home/domain/usecases/add_favorite_usecase.dart' as _i538;
import '../../features/home/domain/usecases/get_favorites_usecase.dart'
    as _i900;
import '../../features/home/domain/usecases/remove_favorite_usecase.dart'
    as _i815;
import '../../features/home/presentation/home_view_model/home_view_model.dart'
    as _i649;
import '../../features/weather/api/api_client/api_client.dart' as _i224;
import '../../features/weather/api/data_sources/weather_remote_data_source_impl.dart'
    as _i210;
import '../../features/weather/data/data_sources/remote/weather_remote_data_source_contract.dart'
    as _i298;
import '../../features/weather/data/repo/weather_repo_impl.dart' as _i384;
import '../../features/weather/domain/repo/weather_repo_contract.dart' as _i788;
import '../../features/weather/domain/use_cases/get_city_forcast_usecase.dart'
    as _i751;
import '../../features/weather/domain/use_cases/get_city_weather_usecase.dart'
    as _i884;
import '../../features/weather/domain/use_cases/get_current_city_forcast_usecase.dart'
    as _i109;
import '../../features/weather/domain/use_cases/get_current_city_weather_usecase.dart'
    as _i912;
import '../../features/weather/presentation/view_model/weather_view_model.dart'
    as _i175;
import '../cache_modules/secure_storage_module.dart' as _i11;
import '../cache_modules/shared_preferences_module.dart' as _i1059;
import '../dio_module/dio_module.dart' as _i773;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i11.SecureStorageService>(
      () => _i11.SecureStorageService(),
    );
    gh.lazySingleton<_i752.LocationService>(() => _i752.LocationService());
    gh.lazySingleton<_i1059.CacheHelper>(
      () => _i1059.CacheHelper(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i874.HomeLocalDataSourceContract>(
      () => _i295.HomeLocalDataSourceImpl(),
    );
    gh.factory<_i224.ApiClient>(() => _i224.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i298.WeatherRemoteDataSourceContract>(
      () => _i210.WeatherRemoteDataSourceImpl(gh<_i224.ApiClient>()),
    );
    gh.factory<_i788.WeatherRepoContract>(
      () => _i384.WeatherRepoImpl(gh<_i298.WeatherRemoteDataSourceContract>()),
    );
    gh.factory<_i109.GetCurrentCityForcastUsecase>(
      () => _i109.GetCurrentCityForcastUsecase(gh<_i788.WeatherRepoContract>()),
    );
    gh.factory<_i912.GetCurrentCityWeatherUsecase>(
      () => _i912.GetCurrentCityWeatherUsecase(gh<_i788.WeatherRepoContract>()),
    );
    gh.factory<_i635.HomeRepoContract>(
      () => _i333.HomeRepoImpl(gh<_i874.HomeLocalDataSourceContract>()),
    );
    gh.factory<_i538.AddFavoriteUseCase>(
      () => _i538.AddFavoriteUseCase(gh<_i635.HomeRepoContract>()),
    );
    gh.factory<_i900.GetFavoritesUseCase>(
      () => _i900.GetFavoritesUseCase(gh<_i635.HomeRepoContract>()),
    );
    gh.factory<_i815.RemoveFavoriteUseCase>(
      () => _i815.RemoveFavoriteUseCase(gh<_i635.HomeRepoContract>()),
    );
    gh.factory<_i751.GetCityForcastUsecase>(
      () => _i751.GetCityForcastUsecase(gh<_i788.WeatherRepoContract>()),
    );
    gh.factory<_i884.GetCityWeatherUsecase>(
      () => _i884.GetCityWeatherUsecase(gh<_i788.WeatherRepoContract>()),
    );
    gh.factory<_i649.HomeViewModel>(
      () => _i649.HomeViewModel(
        gh<_i900.GetFavoritesUseCase>(),
        gh<_i538.AddFavoriteUseCase>(),
        gh<_i815.RemoveFavoriteUseCase>(),
      ),
    );
    gh.factory<_i175.WeatherViewModel>(
      () => _i175.WeatherViewModel(
        gh<_i912.GetCurrentCityWeatherUsecase>(),
        gh<_i109.GetCurrentCityForcastUsecase>(),
        gh<_i751.GetCityForcastUsecase>(),
        gh<_i884.GetCityWeatherUsecase>(),
        gh<_i752.LocationService>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i1059.SharedPreferencesModule {}

class _$DioModule extends _i773.DioModule {}
