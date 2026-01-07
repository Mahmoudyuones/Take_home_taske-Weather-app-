import 'package:flutter/material.dart';
import 'package:take_home_task/core/constants/app_assets_pathes.dart';
import 'package:take_home_task/core/constants/app_text_constants.dart';
import 'package:take_home_task/core/services/avorites_service.dart';
import 'package:take_home_task/core/theme/app_theme.dart';
import 'package:take_home_task/features/home/presentation/view/widgets/city_card.dart';
import 'package:take_home_task/features/home/presentation/view/widgets/current_location_card.dart';
import 'package:take_home_task/features/home/presentation/view/widgets/home_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final savedCities = FavoritesService.getFavorites();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = AppTheme.appTheme.textTheme;

    return Scaffold(
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

                  HomeSearchBar(),

                  SizedBox(height: screenHeight * 0.03),

                  CurrentLocationCard(),

                  SizedBox(height: screenHeight * 0.03),

                  if (savedCities.isNotEmpty) ...[
                    Text(
                      AppTextConstants.savedCities,
                      style: textTheme.headlineLarge?.copyWith(
                        fontSize: screenWidth * (20 / 375),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.5,
                          crossAxisSpacing: screenWidth * 0.04,
                          mainAxisSpacing: screenWidth * 0.04,
                        ),
                        itemCount: savedCities.length,
                        itemBuilder: (context, index) {
                          final cityName = savedCities[index];
                          return CityCard(
                            cityName: cityName,
                            onPressed: () async {
                              final success =
                                  await FavoritesService.removeFavorite(
                                    cityName,
                                  );
                              if (success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '$cityName removed from favorites',
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
