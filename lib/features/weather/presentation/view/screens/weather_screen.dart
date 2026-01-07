import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_task/config/di/di.dart';
import 'package:take_home_task/core/constants/app_assets_pathes.dart';
import 'package:take_home_task/core/constants/app_text_constants.dart';
import 'package:take_home_task/core/theme/app_theme.dart';
import 'package:take_home_task/core/widgets/custom_error_widget.dart';
import 'package:take_home_task/core/widgets/loading_widget.dart';
import 'package:take_home_task/features/weather/presentation/view/widgets/forecast_widget.dart';
import 'package:take_home_task/features/weather/presentation/view/widgets/weather_widget.dart';
import 'package:take_home_task/features/weather/presentation/view_model/home_events.dart';
import 'package:take_home_task/features/weather/presentation/view_model/home_states.dart';
import 'package:take_home_task/features/weather/presentation/view_model/home_view_model.dart';

class WeatherScreen extends StatelessWidget {
  final WeatherViewModel viewModel = getIt<WeatherViewModel>();

  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = AppTheme.appTheme.textTheme;

    return BlocProvider<WeatherViewModel>(
      create: (context) => viewModel
        ..onEvent(GetCurrenCityWeatherEvent())
        ..onEvent(GetCurrenCityForcastEvent()),
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
                                    context.read<WeatherViewModel>().onEvent(
                                      GetCurrenCityWeatherEvent(),
                                    );
                                  },
                                );
                              }

                              if (weatherState?.isLoading == true) {
                                return const LoadingWidget();
                              }

                              if (weatherState?.data != null) {
                                return WeatherWidget(
                                  weatherData: weatherState!.data!,
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
                                    context.read<WeatherViewModel>().onEvent(
                                      GetCurrenCityForcastEvent(),
                                    );
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
