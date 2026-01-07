import 'package:go_router/go_router.dart';
import 'package:take_home_task/core/constants/app_routes_constants.dart';
import 'package:take_home_task/features/weather/presentation/view/screens/weather_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppRoutesConstants.initialLocation,
    routes: [
      GoRoute(
        path: AppRoutesConstants.initialLocation,
        builder: (context, state) => WeatherScreen(),
      ),
    ],
  );
}
