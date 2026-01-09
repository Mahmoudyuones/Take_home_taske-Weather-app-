import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:take_home_task/config/base_state/base_state.dart';

import 'package:take_home_task/features/home/domain/usecases/add_favorite_usecase.dart';
import 'package:take_home_task/features/home/domain/usecases/get_favorites_usecase.dart';
import 'package:take_home_task/features/home/domain/usecases/remove_favorite_usecase.dart';
import 'package:take_home_task/features/home/presentation/home_view_model/home_events.dart';
import 'package:take_home_task/features/home/presentation/home_view_model/home_states.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {
  final GetFavoritesUseCase _getFavoritesUseCase;
  final AddFavoriteUseCase _addFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;

  HomeViewModel(
    this._getFavoritesUseCase,
    this._addFavoriteUseCase,
    this._removeFavoriteUseCase,
  ) : super(
        HomeStates(
          favoriteCitiesState: BaseState<List<String>>(),
          addFavoriteState: BaseState<bool>(),
          removeFavoriteState: BaseState<bool>(),
        ),
      );

  void doIntent(HomesEvents event) {
    switch (event) {
      case GetFavoriteCitiesEvent():
        getFavoriteCities();
        break;
      case AddFavoriteEvent():
        addFavorite(event.cityName);
        break;
      case RemoveFavoriteEvent():
        removeFavorite(event.cityName);
        break;
    }
  }

  Future<void> getFavoriteCities() async {
    emit(
      state.copyWith(
        favoriteCitiesState: state.favoriteCitiesState?.copyWith(
          isLoading: true,
        ),
      ),
    );

    final response = await _getFavoritesUseCase();

    response.when(
      success: (data) {
        emit(
          state.copyWith(
            favoriteCitiesState: state.favoriteCitiesState?.copyWith(
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
            favoriteCitiesState: state.favoriteCitiesState?.copyWith(
              isLoading: false,
              errorMessage: error.message,
            ),
          ),
        );
      },
    );
  }

  Future<void> addFavorite(String cityName) async {
    emit(
      state.copyWith(
        addFavoriteState: state.addFavoriteState?.copyWith(isLoading: true),
      ),
    );

    final response = await _addFavoriteUseCase(cityName);

    response.when(
      success: (data) {
        emit(
          state.copyWith(
            addFavoriteState: state.addFavoriteState?.copyWith(
              isLoading: false,
              data: data,
              errorMessage: null,
            ),
          ),
        );

        getFavoriteCities();
      },
      failure: (error) {
        emit(
          state.copyWith(
            addFavoriteState: state.addFavoriteState?.copyWith(
              isLoading: false,
              errorMessage: error.message,
            ),
          ),
        );
      },
    );
  }

  Future<void> removeFavorite(String cityName) async {
    emit(
      state.copyWith(
        removeFavoriteState: state.removeFavoriteState?.copyWith(
          isLoading: true,
        ),
      ),
    );

    final response = await _removeFavoriteUseCase(cityName);

    response.when(
      success: (data) {
        emit(
          state.copyWith(
            removeFavoriteState: state.removeFavoriteState?.copyWith(
              isLoading: false,
              data: data,
              errorMessage: null,
            ),
          ),
        );

        getFavoriteCities();
      },
      failure: (error) {
        emit(
          state.copyWith(
            removeFavoriteState: state.removeFavoriteState?.copyWith(
              isLoading: false,
              errorMessage: error.message,
            ),
          ),
        );
      },
    );
  }
}
