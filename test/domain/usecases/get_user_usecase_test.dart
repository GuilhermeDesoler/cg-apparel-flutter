import 'package:cg_apparel/domain/entities/user.dart';
import 'package:cg_apparel/domain/usecases/get_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:cg_apparel/domain/repositories/user_repository.dart';

import 'get_user_usecase_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late MockUserRepository mockUserRepository;
  late GetUserUsecase getUserUsecase;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUserUsecase = GetUserUsecase(userRepository: mockUserRepository);
  });

  const tUserId = 'ashjdkahsd';
  const tUser = User(
    id: 'ashjdkahsd',
    name: 'Guilherme',
    email: 'guilherme.desoler@gmail.com',
  );

  test(
    'Should get user information from UserRepository',
    () async {
      // arrange
      when(mockUserRepository.getUser(tUserId))
          .thenAnswer((_) async => const Right(tUser));
      // act
      final result = await getUserUsecase(const GetUserParams(userId: tUserId));
      // assert
      expect(result, equals(const Right(tUser)));
      verify(mockUserRepository.getUser(tUserId));
    },
  );
}
