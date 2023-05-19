// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../config.dart' as _i3;
import '../joke/api/http_joke.repository.dart' as _i6;
import '../joke/domain/joke.repository.dart' as _i5;
import '../joke/domain/joke_service.dart' as _i7;
import '../joke/screens/cubit/joke_cubit.dart' as _i8;
import 'api_client.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioRegisterModule = _$DioRegisterModule();
  gh.singleton<_i3.AppConfig>(_i3.AppConfig());
  gh.singleton<_i4.Dio>(dioRegisterModule.registerClient(get<_i3.AppConfig>()));
  gh.singleton<_i5.JokeRepository>(_i6.HttpJokeRepository(get<_i4.Dio>()));
  gh.singleton<_i7.JokeService>(_i7.JokeService(get<_i5.JokeRepository>()));
  gh.factory<_i8.JokeCubit>(() => _i8.JokeCubit(get<_i7.JokeService>()));
  return get;
}

class _$DioRegisterModule extends _i9.DioRegisterModule {}
