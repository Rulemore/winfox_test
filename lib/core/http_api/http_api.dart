import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:winfox/core/constants.dart';

@injectable
class HttpAPI {
  late final String _baseURLHost = Constants.baseApiUrl;
  HttpAPI();
  Dio newDio({
    int receiveTimeout = 5000,
    int connectTimeout = 5000,
  }) {
    final options = BaseOptions(baseUrl: _baseURLHost);
    options.receiveTimeout = Duration(milliseconds: receiveTimeout);
    options.connectTimeout = Duration(milliseconds: connectTimeout);
    final dio = Dio(options);

    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }
}
