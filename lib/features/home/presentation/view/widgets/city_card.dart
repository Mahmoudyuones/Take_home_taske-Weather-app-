import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_task/core/constants/app_routes_constants.dart';
import 'package:take_home_task/core/theme/app_colors.dart';

class CityCard extends StatelessWidget {
  final String cityName;
  final void Function() onPressed;
  const CityCard({super.key, required this.cityName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        context.push(
          AppRoutesConstants.weather,
          extra: {AppRoutesConstants.cityName: cityName.trim()},
        );
      },
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.03),
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: screenWidth * 0.02,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.location_city,
              color: AppColors.primaryColor,
              size: screenWidth * 0.06,
            ),
            SizedBox(width: screenWidth * 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cityName,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * (14 / 375),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.red,
                size: screenWidth * 0.05,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
