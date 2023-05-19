import 'package:injectable/injectable.dart';

import 'package:random_joke/joke/domain/joke.repository.dart';

import 'joke.dart';

@singleton
class JokeService {
  final JokeRepository _jokeRepository;

  JokeService(this._jokeRepository);

  Future<Joke> getRandomJoke() async {
    return _jokeRepository.getRandomJoke();
  }
}
