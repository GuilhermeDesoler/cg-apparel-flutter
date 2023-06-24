// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cg_apparel/core/error/failures.dart';
import 'package:cg_apparel/core/usecases/usecase.dart';
import 'package:cg_apparel/domain/entities/cart.dart';
import 'package:cg_apparel/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class GetCartUsecase implements Usecase<Cart, NoParams> {
  GetCartUsecase({
    required this.repository,
  });

  final CartRepository repository;

  @override
  Future<Either<Failure, Cart>> call(NoParams params) async {
    return await repository.getCart();
  }
}
