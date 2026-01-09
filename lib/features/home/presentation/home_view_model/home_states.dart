import 'package:take_home_task/config/base_state/base_state.dart';

class HomeStates {
  BaseState<List<String>>? favoriteCitiesState;
  BaseState<bool>? addFavoriteState;
  BaseState<bool>? removeFavoriteState;
  BaseState<bool>? toggleFavoriteState;
  BaseState<bool>? isFavoriteState;
  BaseState<int>? favoritesCountState;
  BaseState<bool>? canAddMoreState;
  BaseState<void>? clearAllState;

  HomeStates({
    this.favoriteCitiesState,
    this.addFavoriteState,
    this.removeFavoriteState,
    this.toggleFavoriteState,
    this.isFavoriteState,
    this.favoritesCountState,
    this.canAddMoreState,
    this.clearAllState,
  });

  HomeStates copyWith({
    BaseState<List<String>>? favoriteCitiesState,
    BaseState<bool>? addFavoriteState,
    BaseState<bool>? removeFavoriteState,
    BaseState<bool>? toggleFavoriteState,
    BaseState<bool>? isFavoriteState,
    BaseState<int>? favoritesCountState,
    BaseState<bool>? canAddMoreState,
    BaseState<void>? clearAllState,
  }) {
    return HomeStates(
      favoriteCitiesState: favoriteCitiesState ?? this.favoriteCitiesState,
      addFavoriteState: addFavoriteState ?? this.addFavoriteState,
      removeFavoriteState: removeFavoriteState ?? this.removeFavoriteState,
      toggleFavoriteState: toggleFavoriteState ?? this.toggleFavoriteState,
      isFavoriteState: isFavoriteState ?? this.isFavoriteState,
      favoritesCountState: favoritesCountState ?? this.favoritesCountState,
      canAddMoreState: canAddMoreState ?? this.canAddMoreState,
      clearAllState: clearAllState ?? this.clearAllState,
    );
  }
}
