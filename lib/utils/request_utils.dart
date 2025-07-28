import 'package:dio/dio.dart';

import '../router/router.dart';

class RequestUtils{
  static Dio _dio = getInstance();

  static Dio getInstance(){
    _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, handler) {
        if (e.response?.statusCode == 401) {
          final router = AppRouter.router;
          router.go('/login');
        }
      },
    ));
    _dio.options.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    return _dio;
  }

  static Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  static Future<Response> post(String url, dynamic data) async {
    return await _dio.post(url, data: data);
  }

  static Future<Response> put(String url, dynamic data) async {
    return await _dio.put(url, data: data);
  }

  static Future<Response> delete(String url) async {
    return await _dio.delete(url);
  }

  static Future<Response> patch(String url, dynamic data) async {
    return await _dio.patch(url, data: data);
  }

  static Future<Response> head(String url) async {
    return await _dio.head(url);
  }
}