import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class GetCurrentUserUseCase extends NoParamsUseCase<UserEntity> {
  final UserRepository _repository;

  GetCurrentUserUseCase(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call() {
    return _repository.getCurrentUser();
  }
}
