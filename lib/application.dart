import 'package:flutter/material.dart';

import 'package:random_joke/joke/screens/random_joke_screen.dart';

import 'infrastructure/theme/theme.dart';

class RandomJokeApplication extends StatefulWidget {
  const RandomJokeApplication({Key? key}) : super(key: key);

  @override
  State<RandomJokeApplication> createState() => _RandomJokeApplicationState();
}

class _RandomJokeApplicationState extends State<RandomJokeApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Joke',
      theme: getTheme(context),
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route _onGenerateRoute(RouteSettings? settings) {
    return RandomJokeScreen.getRoute();
  }
}
