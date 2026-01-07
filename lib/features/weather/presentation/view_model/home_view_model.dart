import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:take_home_task/config/base_state/base_state.dart';
import 'package:take_home_task/core/services/location_service.dart';
import 'package:take_home_task/features/weather/domain/models/forecast_response_entity.dart';
import 'package:take_home_task/features/weather/domain/models/weather_response_entity.dart';
import 'package:take_home_task/features/weather/domain/use_cases/get_current_city_forcast_usecase.dart';
import 'package:take_home_task/features/weather/domain/use_cases/get_current_city_weather_usecase.dart';
import 'package:take_home_task/features/weather/presentation/view_model/home_events.dart';
import 'package:take_home_task/features/weather/presentation/view_model/home_states.dart';

@injectable
class WeatherViewModel extends Cubit<WeatherStates> {
  final GetCurrentCityWeatherUsecase _getCurrenCityWeatherUsecase;
  final GetCurrentCityForcastUsecase _getCurrenCityForcast;
  final LocationService _locationService;

  WeatherViewModel(
    this._getCurrenCityWeatherUsecase,
    this._getCurrenCityForcast,
    this._locationService,
  ) : super(
        WeatherStates(
          weatherResponseEntity: BaseState<WeatherResponseEntity>(),
          forecastResponseEntity: BaseState<ForecastResponseEntity>(),
        ),
      );

  void onEvent(event) {
    switch (event) {
      case GetCurrenCityWeatherEvent():
        {
          getCurrentCityWeather();
        }
      case GetCurrenCityForcastEvent():
        {
          getCurrentCityForcaset();
        }
    }
  }

  void getCurrentCityWeather() async {
    // Set loading to true before fetching location
    emit(
      state.copyWith(
        weatherResponseEntity: state.weatherResponseEntity?.copyWith(
          isLoading: true,
        ),
      ),
    );

    final position = await _locationService.getCurrentLocation();

    if (position == null) {
      emit(
        state.copyWith(
          weatherResponseEntity: state.weatherResponseEntity?.copyWith(
            isLoading: false,
            errorMessage: 'Failed to get location',
          ),
        ),
      );
      return;
    }

    final response = await _getCurrenCityWeatherUsecase.call(
      position.latitude,
      position.longitude,
    );

    response.when(
      success: (data) {
        emit(
          state.copyWith(
            weatherResponseEntity: state.weatherResponseEntity?.copyWith(
              isLoading: false,
              data: data,
              errorMessage: null,
            ),
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            forecastResponseEntity: state.forecastResponseEntity?.copyWith(
              isLoading: false,
              errorMessage: error.message,
            ),
          ),
        );
      },
    );
  }

  void getCurrentCityForcaset() async {
    emit(
      state.copyWith(
        forecastResponseEntity: state.forecastResponseEntity?.copyWith(
          isLoading: true,
        ),
      ),
    );

    final position = await _locationService.getCurrentLocation();

    if (position == null) {
      emit(
        state.copyWith(
          weatherResponseEntity: state.weatherResponseEntity?.copyWith(
            isLoading: false,
            errorMessage: 'Failed to get location',
          ),
        ),
      );
      return;
    }

    final response = await _getCurrenCityForcast.call(
      position.latitude,
      position.longitude,
    );

    response.when(
      success: (data) {
        emit(
          state.copyWith(
            forecastResponseEntity: state.forecastResponseEntity?.copyWith(
              isLoading: false,
              data: data,
              errorMessage: null,
            ),
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            forecastResponseEntity: state.forecastResponseEntity?.copyWith(
              isLoading: false,
              errorMessage: error.message,
            ),
          ),
        );
      },
    );
  }
}
