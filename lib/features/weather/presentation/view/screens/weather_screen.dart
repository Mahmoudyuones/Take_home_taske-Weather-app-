import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_task/config/di/di.dart';
import 'package:take_home_task/core/constants/app_assets_pathes.dart';
import 'package:take_home_task/core/constants/app_routes_constants.dart';
import 'package:take_home_task/core/constants/app_text_constants.dart';
import 'package:take_home_task/core/services/avorites_service.dart';
import 'package:take_home_task/core/theme/app_colors.dart';
import 'package:take_home_task/core/theme/app_theme.dart';
import 'package:take_home_task/core/widgets/custom_error_widget.dart';
import 'package:take_home_task/core/widgets/loading_widget.dart';
import 'package:take_home_task/features/weather/presentation/view/widgets/forecast_widget.dart';
import 'package:take_home_task/features/weather/presentation/view/widgets/weather_widget.dart';
import 'package:take_home_task/features/weather/presentation/view_model/home_events.dart';
import 'package:take_home_task/features/weather/presentation/view_model/home_states.dart';
import 'package:take_home_task/features/weather/presentation/view_model/home_view_model.dart';

class WeatherScreen extends StatefulWidget {
  final String? cityName;

  const WeatherScreen({super.key, this.cityName});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherViewModel viewModel = getIt<WeatherViewModel>();
  bool isFavorite = false;

  void _toggleFavorite(String currentCityName) async {
    if (currentCityName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Loading location data. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Get the ACTUAL current state from Hive
    final isCurrentlyFavorite = FavoritesService.isFavorite(currentCityName);

    // If not a favorite and trying to add, check if we can add more
    if (!isCurrentlyFavorite && !FavoritesService.canAddMore()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Maximum 6 favorites reached. Remove one to add more.'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Toggle favorite
    final success = await FavoritesService.toggleFavorite(currentCityName);

    if (success) {
      // Update local state to match what's actually in Hive
      final newFavoriteState = FavoritesService.isFavorite(currentCityName);

      setState(() {
        isFavorite = newFavoriteState;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            newFavoriteState
                ? '$currentCityName added to favorites'
                : '$currentCityName removed from favorites',
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update favorites'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = AppTheme.appTheme.textTheme;

    // Check if cityName is valid (not null and not empty)
    final bool hasValidCityName = widget.cityName?.trim().isNotEmpty ?? false;

    return BlocProvider<WeatherViewModel>(
      create: (context) {
        if (hasValidCityName) {
          // Use city name if provided
          return viewModel
            ..doIntent(GetCityWeatherEvent(widget.cityName!))
            ..doIntent(GetCityForecastEvent(widget.cityName!));
        } else {
          // Use current location if city name is null or empty
          return viewModel
            ..doIntent(GetCurrenCityWeatherEvent())
            ..doIntent(GetCurrenCityForcastEvent());
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,

        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppAssetsPathes.backgroundImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),

            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: SafeArea(
                      bottom: false,

                      child: Column(
                        children: [
                          BlocBuilder<WeatherViewModel, WeatherStates>(
                            buildWhen: (previous, current) =>
                                previous.weatherResponseEntity !=
                                current.weatherResponseEntity,
                            builder: (context, state) {
                              final weatherState = state.weatherResponseEntity;

                              if (weatherState?.errorMessage != null &&
                                  weatherState!.errorMessage!.isNotEmpty) {
                                return CustomErrorWidget(
                                  message: weatherState.errorMessage!,
                                  onRetry: () {
                                    if (hasValidCityName) {
                                      context.read<WeatherViewModel>().doIntent(
                                        GetCityWeatherEvent(widget.cityName!),
                                      );
                                    } else {
                                      context.read<WeatherViewModel>().doIntent(
                                        GetCurrenCityWeatherEvent(),
                                      );
                                    }
                                  },
                                );
                              }

                              if (weatherState?.isLoading == true) {
                                return const LoadingWidget();
                              }

                              if (weatherState?.data != null) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * .05,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.search,
                                              color: AppColors.white,
                                              size: screenWidth * 0.07,
                                            ),
                                            onPressed: () {
                                              context.go(
                                                AppRoutesConstants
                                                    .initialLocation,
                                              );
                                            },
                                          ),
                                          SizedBox(width: screenWidth * 0.02),
                                          IconButton(
                                            icon: Icon(
                                              isFavorite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: isFavorite
                                                  ? Colors.red
                                                  : AppColors.white,
                                              size: screenWidth * 0.07,
                                            ),
                                            onPressed: () {
                                              _toggleFavorite(
                                                state
                                                    .weatherResponseEntity!
                                                    .data!
                                                    .name,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    WeatherWidget(
                                      weatherData: weatherState!.data!,
                                    ),
                                  ],
                                );
                              }
                              return Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.2,
                                  ),
                                  child: Text(
                                    AppTextConstants.noWeatherDataAvailable,
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontSize: screenWidth * (16 / 375),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: screenHeight * 0.025),

                          BlocBuilder<WeatherViewModel, WeatherStates>(
                            buildWhen: (previous, current) =>
                                previous.forecastResponseEntity !=
                                current.forecastResponseEntity,
                            builder: (context, state) {
                              final forecastState =
                                  state.forecastResponseEntity;

                              if (forecastState?.isLoading == true) {
                                return const LoadingWidget();
                              }

                              if (forecastState?.errorMessage != null &&
                                  forecastState!.errorMessage!.isNotEmpty) {
                                return CustomErrorWidget(
                                  message: forecastState.errorMessage!,
                                  onRetry: () {
                                    if (hasValidCityName) {
                                      context.read<WeatherViewModel>().doIntent(
                                        GetCityForecastEvent(widget.cityName!),
                                      );
                                    } else {
                                      context.read<WeatherViewModel>().doIntent(
                                        GetCurrenCityForcastEvent(),
                                      );
                                    }
                                  },
                                );
                              }

                              if (forecastState?.data != null) {
                                return ForecastWidget(
                                  forecastData: forecastState!.data!,
                                );
                              }

                              return const SizedBox.shrink();
                            },
                          ),

                          SizedBox(height: screenHeight * 0.025),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
