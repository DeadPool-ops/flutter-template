import 'package:dartz/dartz.dart';
import 'package:error_notification_app/core/errors/failures.dart';

/// Base class for all use cases.
/// [Type] is the return type, [Params] is the input parameters.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use case with no parameters
abstract class NoParamsUseCase<Type> {
  Future<Either<Failure, Type>> call();
}

/// Synchronous use case
abstract class SyncUseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

/// Placeholder for use cases that take no parameters
class NoParams {
  const NoParams();
}
