import 'package:chef_staff/data/repository/auth_repository.dart';
import 'package:chef_staff/core/secure_storage.dart';
import 'package:chef_staff/main.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required AuthRepository repo}) : _repo = repo;
  final Dio _dio = Dio();

  final AuthRepository _repo;
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final jwt = await SecureStorage.getToken();
    if (jwt != null) {
      options.headers["Authorization"] = "Bearer $jwt";
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final result = await _repo.refreshToken();
      if (result) {
        final jwt = SecureStorage.getToken();
        err.requestOptions.headers['Authorizat'] = "Bearer $jwt";
        return handler.resolve(await _dio.request(
          err.requestOptions.baseUrl + err.requestOptions.path,
          options: Options(
            headers: err.requestOptions.headers,
            method: err.requestOptions.method,
          ),
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters 
        ));
      }else{
        await _repo.logout();
        navigatorKey.currentContext!.go('/');
      }
    }
  }
}
