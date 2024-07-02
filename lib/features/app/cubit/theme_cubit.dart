import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winfox/core/app_state.dart';
import 'package:winfox/core/theme/dart_theme.dart';
import 'package:winfox/core/theme/light_theme.dart';

class ThemeCubit extends Cubit<AppState> {
  ThemeCubit() : super(AppStateSuccess(getLightTheme()));

  void changeTheme(bool value) {
    if (value) {
      emit(AppStateSuccess(getLightTheme()));
    } else {
      emit(AppStateSuccess(getDarkTheme()));
    }
  }
}
