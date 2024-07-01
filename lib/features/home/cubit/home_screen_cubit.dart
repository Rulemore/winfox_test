import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winfox/core/app_state.dart';
import 'package:winfox/core/di/di.dart';
import 'package:winfox/domain/jokes/repository/jokes_repository.dart';

class HomeScreenCubit extends Cubit<AppState> {
  HomeScreenCubit() : super(AppStateDefault()) {
    loadJokes();
  }
  final _repository = getIt<JokesRepository>();

  Future<void> loadJokes() async {
    try {
      emit(AppStateLoading());
      final jokes = await _repository.getJokes();
      jokes.sort((a, b) => b.id.compareTo(a.id));
      emit(AppStateSuccess(jokes));
    } catch (e) {
      emit(AppState.catchErrorHandler(e));
    }
  }
}
