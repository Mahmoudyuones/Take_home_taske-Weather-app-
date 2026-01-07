import 'package:flutter/material.dart';
import 'package:take_home_task/core/theme/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.2),
        child: CircularProgressIndicator(color: AppColors.white),
      ),
    );
  }
}
