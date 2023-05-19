part of 'joke_cubit.dart';

@immutable
abstract class JokeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class JokeInitial extends JokeState {}

class JokeLoading extends JokeState {}

class JokeSuccess extends JokeState {
  final Joke joke;

  JokeSuccess({
    required this.joke,
  });

  @override
  List<Object?> get props => [joke];
}

class JokePunchlineSuccess extends JokeSuccess {
  JokePunchlineSuccess({required Joke joke}) : super(joke: joke);
}

class JokeError extends JokeState {
  final String message;

  JokeError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
