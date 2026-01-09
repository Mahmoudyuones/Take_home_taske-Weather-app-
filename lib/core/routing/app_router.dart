import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_task/core/constants/app_routes_constants.dart';
import 'package:take_home_task/features/home/presentation/view/screens/home_screen.dart';
import 'package:take_home_task/features/weather/presentation/view/screens/weather_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppRoutesConstants.weather,
    routes: [
      GoRoute(
        path: AppRoutesConstants.initialLocation,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutesConstants.weather,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final cityName = extra?[AppRoutesConstants.cityName] as String?;

          return WeatherScreen(key: ValueKey(cityName), cityName: cityName);
        },
      ),
    ],
  );
}
