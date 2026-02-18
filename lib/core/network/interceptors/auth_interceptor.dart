import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../constants/app_constants.dart';
import '../local_storage_service.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final LocalStorageService _storage;

  AuthInterceptor(this._storage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.getString(AppConstants.tokenKey);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      // TODO: Implement token refresh logic here
      // If refresh fails, clear storage and navigate to login
    }
    handler.next(err);
  }
}
