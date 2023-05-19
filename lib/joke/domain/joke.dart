import 'package:equatable/equatable.dart';

class Joke extends Equatable {
  final int id;
  final String setup;
  final String punchline;

  const Joke({
    required this.id,
    required this.setup,
    required this.punchline,
  });

  @override
  List<Object?> get props => [id, setup, punchline];
}
