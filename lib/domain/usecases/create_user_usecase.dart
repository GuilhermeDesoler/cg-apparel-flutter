import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:cg_apparel/core/error/failures.dart';
import 'package:cg_apparel/core/usecases/usecase.dart';
import 'package:cg_apparel/domain/repositories/user_repository.dart';

import '../entities/user.dart';

class CreateUserUsecase implements Usecase<User, CreateUserParams> {
  CreateUserUsecase({
    required this.repository,
  });

  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(CreateUserParams params) async {
    return await repository.createUser(params.user);
  }
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.user,
  });

  final User user;

  @override
  List<Object?> get props => [user];
}
