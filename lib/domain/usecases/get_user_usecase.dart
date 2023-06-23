import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:cg_apparel/core/error/failures.dart';
import 'package:cg_apparel/core/usecases/usecase.dart';
import 'package:cg_apparel/domain/entities/user.dart';
import 'package:cg_apparel/domain/repositories/user_repository.dart';

class GetUserUsecase implements Usecase<User, GetUserParams> {
  const GetUserUsecase({
    required this.userRepository,
  });

  final UserRepository userRepository;

  @override
  Future<Either<Failure, User>> call(GetUserParams params) async {
    return await userRepository.getUser(params.userId);
  }
}

class GetUserParams extends Equatable {
  const GetUserParams({
    required this.userId,
  });

  final String userId;

  @override
  List<Object?> get props => [];
}
