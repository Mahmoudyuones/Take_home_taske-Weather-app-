// lib/core/services/favorites_service.dart

import 'package:hive_flutter/hive_flutter.dart';

class FavoritesService {
  static const String _boxName = 'favorites';
  static const String _favoritesKey = 'favorite_cities';
  static const int maxFavorites = 12;

  // Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_boxName);
  }

  // Get the Hive box
  static Box _getBox() {
    return Hive.box(_boxName);
  }

  // Get all favorite cities
  static List<String> getFavorites() {
    final box = _getBox();
    final favorites = box.get(_favoritesKey, defaultValue: <String>[]);
    return List<String>.from(favorites);
  }

  // Check if a city is favorite
  static bool isFavorite(String cityName) {
    final favorites = getFavorites();
    return favorites.contains(cityName.trim());
  }

  // Add a city to favorites
  static Future<bool> addFavorite(String cityName) async {
    final box = _getBox();
    final favorites = getFavorites();

    final trimmedCity = cityName.trim();

    // Check if already exists
    if (favorites.contains(trimmedCity)) {
      return false;
    }

    // Check if maximum reached
    if (favorites.length >= maxFavorites) {
      return false;
    }

    favorites.add(trimmedCity);
    await box.put(_favoritesKey, favorites);
    return true;
  }

  // Remove a city from favorites
  static Future<bool> removeFavorite(String cityName) async {
    final box = _getBox();
    final favorites = getFavorites();

    final trimmedCity = cityName.trim();

    if (!favorites.contains(trimmedCity)) {
      return false;
    }

    favorites.remove(trimmedCity);
    await box.put(_favoritesKey, favorites);
    return true;
  }

  // Toggle favorite status
  static Future<bool> toggleFavorite(String cityName) async {
    if (isFavorite(cityName)) {
      return await removeFavorite(cityName);
    } else {
      return await addFavorite(cityName);
    }
  }

  // Clear all favorites
  static Future<void> clearAllFavorites() async {
    final box = _getBox();
    await box.delete(_favoritesKey);
  }

  // Get favorites count
  static int getFavoritesCount() {
    return getFavorites().length;
  }

  // Check if can add more favorites
  static bool canAddMore() {
    return getFavoritesCount() < maxFavorites;
  }
}
