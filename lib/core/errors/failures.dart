import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

/// Server / API failure
class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.statusCode});
}

/// No internet / network failure
class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'No internet connection.'});
}

/// Local cache failure
class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Cache error occurred.'});
}

/// Auth / session failure
class AuthFailure extends Failure {
  const AuthFailure({super.message = 'Authentication failed.'});
}

/// Unknown failure
class UnknownFailure extends Failure {
  const UnknownFailure({super.message = 'An unknown error occurred.'});
}
