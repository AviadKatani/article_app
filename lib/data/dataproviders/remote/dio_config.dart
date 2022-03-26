import 'package:articles_app/data/dataproviders/remote/api_config.dart';
import 'package:dio/dio.dart';

class DioConfig {
  static Dio configureDio() {
    final options = BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      contentType: "application/json; charset=utf-8",
    );

    var dio = Dio(options);
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }
}
