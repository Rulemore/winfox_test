import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:winfox/core/di/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void confingureDependecies() {
  getIt.init();
}
