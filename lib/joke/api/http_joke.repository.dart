import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:random_joke/joke/api/client/joke_api_client.dart';
import 'package:random_joke/joke/api/dto/joke_dto.dart';
import 'package:random_joke/joke/domain/joke.dart';
import 'package:random_joke/joke/domain/joke.exceptions.dart';
import 'package:random_joke/joke/domain/joke.repository.dart';

@Singleton(as: JokeRepository)
class HttpJokeRepository implements JokeRepository {
  final Dio _dio;

  HttpJokeRepository(this._dio);

  @override
  Future<Joke> getRandomJoke() async {
    try {
      final response = await _dio.get(JokeApiClient.random);
      final jokeDTO = JokeDTO.fromJson(response.data);

      return jokeDTO.toJoke();
    } on DioError catch (error) {
      if (error.response == null) {
        throw const NoResultException();
      }
      rethrow;
    }
  }
}
