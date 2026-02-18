import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../errors/exceptions.dart';

@lazySingleton
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.unknown) {
      throw const NetworkException();
    }

    final statusCode = err.response?.statusCode;
    final message = err.response?.data?['message'] as String? ??
        err.message ??
        'An error occurred';

    if (statusCode == 401) {
      throw AuthException(message: message);
    }

    throw ServerException(message: message, statusCode: statusCode);
  }
}
