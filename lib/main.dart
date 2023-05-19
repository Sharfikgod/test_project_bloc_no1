import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:random_joke/infrastructure/injectable.init.dart';

import 'application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final getIt = GetIt.instance;

  await configureDependencies(getIt);

  runApp(const RandomJokeApplication());
}
