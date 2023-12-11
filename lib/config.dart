import 'package:injectable/injectable.dart';

@singleton
class AppConfig {
  static const _baseUrl = 'https://joke.api.gkamelo.xyz';
  static const _apiKey = '';

  String get baseUrl => _baseUrl;
  String get apiKey => _apiKey;

  AppConfig();
}
