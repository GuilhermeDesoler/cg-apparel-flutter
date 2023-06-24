// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cg_apparel/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:cg_apparel/core/usecases/usecase.dart';
import 'package:cg_apparel/domain/entities/product.dart';

import '../repositories/cart_repository.dart';

class RemoveProductFromCartUsecase
    implements Usecase<void, RemoveProductFromCartParams> {
  RemoveProductFromCartUsecase({
    required this.repository,
  });

  final CartRepository repository;

  @override
  Future<Either<Failure, void>> call(
    RemoveProductFromCartParams params,
  ) async {
    return await repository.removeProductFromCart(params.product);
  }
}

class RemoveProductFromCartParams extends Equatable {
  const RemoveProductFromCartParams({
    required this.product,
  });

  final Product product;

  @override
  List<Object?> get props => [product];
}
