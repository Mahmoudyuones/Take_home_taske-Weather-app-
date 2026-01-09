import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_task/config/di/di.dart';
import 'package:take_home_task/core/constants/api_constants.dart';
import 'package:take_home_task/core/constants/app_assets_pathes.dart';
import 'package:take_home_task/core/constants/app_routes_constants.dart';
import 'package:take_home_task/core/constants/app_text_constants.dart';
import 'package:take_home_task/core/theme/app_colors.dart';
import 'package:take_home_task/core/theme/app_theme.dart';
import 'package:take_home_task/core/widgets/custom_error_widget.dart';
import 'package:take_home_task/core/widgets/loading_widget.dart';
import 'package:take_home_task/features/home/presentation/home_view_model/home_events.dart';
import 'package:take_home_task/features/home/presentation/home_view_model/home_states.dart';
import 'package:take_home_task/features/home/presentation/home_view_model/home_view_model.dart';
import 'package:take_home_task/features/weather/presentation/view/widgets/forecast_widget.dart';
import 'package:take_home_task/features/weather/presentation/view/widgets/weather_widget.dart';
import 'package:take_home_task/features/weather/presentation/view_model/weather_events.dart';
import 'package:take_home_task/features/weather/presentation/view_model/weather_states.dart';
import 'package:take_home_task/features/weather/presentation/view_model/weather_view_model.dart';

class WeatherScreen extends StatefulWidget {
  final String? cityName;

  const WeatherScreen({super.key, this.cityName});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherViewModel weatherViewModel = getIt<WeatherViewModel>();
  final HomeViewModel favoritesViewModel = getIt<HomeViewModel>();

  String? _currentCityName;

  @override
  void initState() {
    super.initState();
    _currentCityName = widget.cityName;
  }

  void _onFavoriteClicked(
    BuildContext context,
    List<String> favorites,
    String cityName,
    bool isFavorite,
  ) {
    final favoritesBloc = context.read<HomeViewModel>();

    if (isFavorite) {
      favoritesBloc.doIntent(RemoveFavoriteEvent(cityName));
      setState(() {});
      return;
    }

    if (favorites.length >= ApiConstants.maxFavorites) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'You can only add up to ${ApiConstants.maxFavorites} favorite cities',
          ),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    favoritesBloc.doIntent(AddFavoriteEvent(cityName));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = AppTheme.appTheme.textTheme;
    final bool hasValidCityName = widget.cityName?.trim().isNotEmpty ?? false;

    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherViewModel>(
          create: (context) {
            if (hasValidCityName) {
              return weatherViewModel
                ..doIntent(GetCityWeatherEvent(widget.cityName!))
                ..doIntent(GetCityForecastEvent(widget.cityName!));
            } else {
              return weatherViewModel
                ..doIntent(GetCurrenCityWeatherEvent())
                ..doIntent(GetCurrenCityForcastEvent());
            }
          },
        ),
        BlocProvider<HomeViewModel>.value(
          value: favoritesViewModel..doIntent(GetFavoriteCitiesEvent()),
        ),
      ],
      child: Scaffold(
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
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * .05,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    color: AppColors.white,
                                    size: screenWidth * 0.07,
                                  ),
                                  onPressed: () {
                                    context.go(
                                      AppRoutesConstants.initialLocation,
                                    );
                                  },
                                ),
                                BlocBuilder<HomeViewModel, HomeStates>(
                                  buildWhen: (previous, current) =>
                                      previous.favoriteCitiesState !=
                                      current.favoriteCitiesState,
                                  builder: (context, state) {
                                    final favorites =
                                        state.favoriteCitiesState?.data ?? [];

                                    final cityName = _currentCityName;

                                    if (cityName == null || cityName.isEmpty) {
                                      return IconButton(
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: AppColors.white,
                                          size: screenWidth * 0.07,
                                        ),
                                        onPressed: null,
                                      );
                                    }

                                    final bool isFavorite = favorites.contains(
                                      cityName,
                                    );

                                    return IconButton(
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
                                        _onFavoriteClicked(
                                          context,
                                          favorites,
                                          cityName,
                                          isFavorite,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
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
                                // Update current city name from weather data
                                final cityNameFromData =
                                    weatherState!.data!.name;
                                if (_currentCityName != cityNameFromData) {
                                  WidgetsBinding.instance.addPostFrameCallback((
                                    _,
                                  ) {
                                    setState(() {
                                      _currentCityName = cityNameFromData;
                                    });
                                  });
                                }

                                return WeatherWidget(
                                  weatherData: weatherState.data!,
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
