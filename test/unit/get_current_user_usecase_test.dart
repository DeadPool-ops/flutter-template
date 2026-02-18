import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_template/core/errors/failures.dart';
import 'package:flutter_template/domain/entities/user_entity.dart';
import 'package:flutter_template/domain/repositories/user_repository.dart';
import 'package:flutter_template/domain/usecases/get_current_user_usecase.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late GetCurrentUserUseCase useCase;
  late MockUserRepository mockRepository;

  setUp(() {
    mockRepository = MockUserRepository();
    useCase = GetCurrentUserUseCase(mockRepository);
  });

  final tUser = UserEntity(
    id: '1',
    name: 'Test User',
    email: 'test@example.com',
    createdAt: DateTime(2024),
  );

  group('GetCurrentUserUseCase', () {
    test('should return UserEntity on success', () async {
      // Arrange
      when(() => mockRepository.getCurrentUser())
          .thenAnswer((_) async => Right(tUser));

      // Act
      final result = await useCase();

      // Assert
      expect(result, Right(tUser));
      verify(() => mockRepository.getCurrentUser()).called(1);
    });

    test('should return Failure on error', () async {
      // Arrange
      const failure = ServerFailure(message: 'Server error');
      when(() => mockRepository.getCurrentUser())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, const Left(failure));
    });
  });
}
