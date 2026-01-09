import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_task/config/di/di.dart';
import 'package:take_home_task/core/constants/app_assets_pathes.dart';
import 'package:take_home_task/core/constants/app_text_constants.dart';
import 'package:take_home_task/core/theme/app_theme.dart';
import 'package:take_home_task/core/widgets/custom_error_widget.dart';
import 'package:take_home_task/core/widgets/loading_widget.dart';
import 'package:take_home_task/features/home/presentation/home_view_model/home_events.dart';
import 'package:take_home_task/features/home/presentation/home_view_model/home_states.dart';
import 'package:take_home_task/features/home/presentation/home_view_model/home_view_model.dart';
import 'package:take_home_task/features/home/presentation/view/widgets/city_card.dart';
import 'package:take_home_task/features/home/presentation/view/widgets/current_location_card.dart';
import 'package:take_home_task/features/home/presentation/view/widgets/home_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = AppTheme.appTheme.textTheme;

    return BlocProvider.value(
      value: getIt<HomeViewModel>()..doIntent(GetFavoriteCitiesEvent()),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppAssetsPathes.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppTextConstants.selectLocation,
                      style: textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppTextConstants.chooseLocationDescription,
                      style: textTheme.bodyMedium,
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    const HomeSearchBar(),

                    SizedBox(height: screenHeight * 0.03),

                    const CurrentLocationCard(),

                    SizedBox(height: screenHeight * 0.03),

                    BlocBuilder<HomeViewModel, HomeStates>(
                      builder: (context, state) {
                        final favoritesState = state.favoriteCitiesState;

                        if (favoritesState?.isLoading == true) {
                          return const Expanded(
                            child: Center(child: LoadingWidget()),
                          );
                        }

                        if (favoritesState?.errorMessage != null &&
                            favoritesState!.errorMessage!.isNotEmpty) {
                          return Expanded(
                            child: Center(
                              child: CustomErrorWidget(
                                message: favoritesState.errorMessage!,
                                onRetry: () {
                                  context.read<HomeViewModel>().doIntent(
                                    GetFavoriteCitiesEvent(),
                                  );
                                },
                              ),
                            ),
                          );
                        }

                        final favorites = favoritesState?.data ?? [];

                        if (favorites.isEmpty) {
                          return const SizedBox.shrink();
                        }

                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppTextConstants.savedCities,
                                style: textTheme.headlineLarge?.copyWith(
                                  fontSize: screenWidth * (20 / 375),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 2.5,
                                        crossAxisSpacing: screenWidth * 0.04,
                                        mainAxisSpacing: screenWidth * 0.04,
                                      ),
                                  itemCount: favorites.length,
                                  itemBuilder: (context, index) {
                                    final cityName = favorites[index];
                                    return CityCard(
                                      cityName: cityName,
                                      onPressed: () {
                                        context.read<HomeViewModel>().doIntent(
                                          RemoveFavoriteEvent(cityName),
                                        );

                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '$cityName removed from favorites',
                                            ),
                                            duration: const Duration(
                                              seconds: 2,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
