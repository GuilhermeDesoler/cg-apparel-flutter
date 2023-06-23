import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:cg_apparel/domain/repositories/user_repository.dart';
import 'package:cg_apparel/domain/usecases/create_user_usecase.dart';
import 'package:cg_apparel/domain/entities/user.dart';

import 'create_user_usecase_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late MockUserRepository mockUserRepository;
  late CreateUserUsecase createUserUsecase;

  setUp(() {
    mockUserRepository = MockUserRepository();
    createUserUsecase = CreateUserUsecase(repository: mockUserRepository);
  });

  const tUser = User(
    id: '',
    name: 'Guilherme',
    email: 'guilherme.desoler@gmail.com',
  );

  const tCreatedUser = User(
    id: 'shfkasghkuas',
    name: 'Guilherme',
    email: 'guilherme.desoler@gmail.com',
  );

  test(
    'Should create and return a user from the UserRepository',
    () async {
      // arrange
      when(mockUserRepository.createUser(tUser))
          .thenAnswer((_) async => const Right(tCreatedUser));
      // act
      final result =
          await createUserUsecase(const CreateUserParams(user: tUser));
      // assert
      expect(result, const Right(tCreatedUser));
      verify(mockUserRepository.createUser(tUser));
    },
  );
}
