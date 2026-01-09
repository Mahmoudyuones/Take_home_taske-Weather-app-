import 'package:flutter/material.dart';
import 'package:take_home_task/config/di/di.dart';
import 'package:take_home_task/features/home/data/datasources/local/home_local_data_source_impl.dart';
import 'package:take_home_task/init_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HomeLocalDataSourceImpl.init();

  await configureDependencies();
  runApp(const InitScreen());
}
