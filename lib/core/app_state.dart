library helpers;

import 'package:dio/dio.dart' show DioException;

abstract class AppState {
  static AppStateError catchErrorHandler(Object? error, {String? details}) {
    if (error == null) {
      return AppStateError('unidentified error', details: details);
    }
    if (error is AppStateError) {
      return error;
    } else if (error is DioException) {
      return AppStateError('Ошибка сети');
    } else if (error is TypeError) {
      return AppStateError('Неизвестная ошибка');
    }
    return AppStateError(error.toString(), details: details);
  }
}

class AppStateSuccess<T> implements AppState {
  T? data;

  AppStateSuccess([this.data]);

  bool isEmpty() {
    return data == null;
  }

  T get() {
    return data!;
  }
}

class AppStateError extends AppState implements Exception {
  final String message;
  final String? key;
  final String? details;

  AppStateError(this.message, {this.key, this.details});

  @override
  String toString() {
    return key != null ? '[$key] $message' : message;
  }
}

class AppStateDefault extends AppState {}

class AppStateLoading extends AppState {}
