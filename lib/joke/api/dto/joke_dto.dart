import 'package:json_annotation/json_annotation.dart';

import 'package:random_joke/joke/domain/joke.dart';

part 'joke_dto.g.dart';

@JsonSerializable(createToJson: false)
class JokeDTO {
  final int id;
  final String setup;
  final String punchline;

  JokeDTO({
    required this.id,
    required this.setup,
    required this.punchline,
  });

  factory JokeDTO.fromJson(Map<String, dynamic> json) => _$JokeDTOFromJson(json);

  Joke toJoke() {
    return Joke(
      id: id,
      setup: setup.trim(),
      punchline: punchline.trim(),
    );
  }
}
