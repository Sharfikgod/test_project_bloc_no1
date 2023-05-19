import 'package:injectable/injectable.dart';

@singleton
class AppConfig {
  static const _baseUrl = 'https://joke.api.gkamelo.xyz';
  static const _apiKey = 'QUtFhHPnlQ5f13LDVpQL3a54XgQzTlCJa1PMSB3o';

  String get baseUrl => _baseUrl;
  String get apiKey => _apiKey;

  AppConfig();
}
