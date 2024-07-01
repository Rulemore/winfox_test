// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:winfox/core/http_api/http_api.dart' as _i4;
import 'package:winfox/core/network_handler/network_handler.dart' as _i3;
import 'package:winfox/core/services/network_service.dart' as _i5;
import 'package:winfox/domain/jokes/repository/jokes_repository.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.NetworkHandler>(() => _i3.NetworkHandler());
    gh.factory<_i4.HttpAPI>(() => _i4.HttpAPI());
    gh.factory<_i5.NetworkService>(
        () => _i5.NetworkService(httpAPI: gh<_i4.HttpAPI>()));
    gh.factory<_i6.JokesRepository>(
        () => _i6.JokesRepository(gh<_i5.NetworkService>()));
    return this;
  }
}
