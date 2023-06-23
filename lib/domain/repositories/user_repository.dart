import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> createUser(User user);
  Future<Either<Failure, User>> getUser(String userId);
  // Future<<Either<Failure, User>> updateUser();
  // Future<<Either<Failure, String>> deleteUser();
}
