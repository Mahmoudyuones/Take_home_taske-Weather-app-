abstract class HomesEvents {}

class GetFavoriteCitiesEvent extends HomesEvents {}

class AddFavoriteEvent extends HomesEvents {
  final String cityName;
  AddFavoriteEvent(this.cityName);
}

class RemoveFavoriteEvent extends HomesEvents {
  final String cityName;
  RemoveFavoriteEvent(this.cityName);
}

class ToggleFavoriteEvent extends HomesEvents {
  final String cityName;
  ToggleFavoriteEvent(this.cityName);
}

class CheckIsFavoriteEvent extends HomesEvents {
  final String cityName;
  CheckIsFavoriteEvent(this.cityName);
}

class GetFavoritesCountEvent extends HomesEvents {}

class CheckCanAddMoreEvent extends HomesEvents {}

class ClearAllFavoritesEvent extends HomesEvents {}
