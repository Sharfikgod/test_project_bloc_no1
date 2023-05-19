import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:random_joke/infrastructure/theme/theme_extension.dart';
import 'package:random_joke/joke/screens/cubit/joke_cubit.dart';

// Sizes
const double _padding = 15.0;
const double _spaceHeight = 35.0;
// Texts
const String _appBarTitle = 'Make me laugh';

class RandomJokeScreen extends StatefulWidget {
  static const _routeName = 'random-joke';

  static PageRoute<RandomJokeScreen> getRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (_) {
        return BlocProvider(
          create: (_) => JokeCubit.create(),
          child: const RandomJokeScreen(),
        );
      },
    );
  }

  const RandomJokeScreen({Key? key}) : super(key: key);

  @override
  State<RandomJokeScreen> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appBarTitle),
      ),
      body: BlocBuilder<JokeCubit, JokeState>(
        builder: (context, state) {
          if (state is JokeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is JokeSuccess) {
            return Padding(
              padding: const EdgeInsets.all(_padding),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.joke.setup,
                      style: context.theme.textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: _spaceHeight),
                    if (state is JokePunchlineSuccess)
                      Text(
                        state.joke.punchline,
                        style: context.theme.textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              ),
            );
          } else {
            final errorMessage = (state as JokeError).message;
            return Center(
              child: Text(
                errorMessage,
                style: context.theme.textTheme.headline5,
              ),
            );
          }
        },
      ),
    );
  }
}
