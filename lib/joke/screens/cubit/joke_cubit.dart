import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:random_joke/joke/domain/joke.dart';
import 'package:random_joke/joke/domain/joke.exceptions.dart';
import 'package:random_joke/joke/domain/joke_service.dart';

part 'joke_state.dart';

const int _nextJokeTimeInSeconds = 10;
const int _showPunchlineTimeInSeconds = 3;

@injectable
class JokeCubit extends Cubit<JokeState> {
  static JokeCubit create() => GetIt.instance.get<JokeCubit>();

  final JokeService _jokeService;

  JokeCubit(this._jokeService) : super(JokeInitial()) {
    _getRandomJoke();
    Timer.periodic(const Duration(seconds: _nextJokeTimeInSeconds), (_) => _getRandomJoke());
  }

  Future<void> _getRandomJoke() async {
    emit(JokeLoading());

    try {
      final joke = await _jokeService.getRandomJoke();
      emit(JokeSuccess(joke: joke));
      Future.delayed(const Duration(seconds: _showPunchlineTimeInSeconds), () {
        emit(JokePunchlineSuccess(joke: joke));
      });
    } on NoResultException catch (error) {
      final message = error.toString();
      emit(JokeError(message: message));
    }
  }
}
