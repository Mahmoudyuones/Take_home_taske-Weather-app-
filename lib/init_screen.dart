import 'package:flutter/material.dart';
import 'package:take_home_task/core/routing/app_router.dart';
import 'package:take_home_task/core/theme/app_theme.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
