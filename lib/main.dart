import 'package:flutter/material.dart';
import 'package:take_home_task/config/di/di.dart';
import 'package:take_home_task/init_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const InitScreen());
}
