import 'joke.dart';

abstract class JokeRepository {
  Future<Joke> getRandomJoke();
}
