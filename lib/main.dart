import 'package:flutter/material.dart';
import 'package:take_home_task/config/di/di.dart';
import 'package:take_home_task/core/services/avorites_service.dart';
import 'package:take_home_task/init_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FavoritesService.init();

  await configureDependencies();
  runApp(const InitScreen());
}
