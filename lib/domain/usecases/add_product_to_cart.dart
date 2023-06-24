// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:cg_apparel/core/error/failures.dart';
import 'package:cg_apparel/core/usecases/usecase.dart';

import '../entities/product.dart';
import '../repositories/cart_repository.dart';

class AddPoductToCart implements Usecase<void, AddPoductToCartParams> {
  AddPoductToCart({
    required this.repository,
  });

  final CartRepository repository;

  @override
  Future<Either<Failure, void>> call(AddPoductToCartParams params) async {
    return await repository.addProductToCart(params.product);
  }
}

class AddPoductToCartParams extends Equatable {
  const AddPoductToCartParams({
    required this.product,
  });

  final Product product;

  @override
  List<Object?> get props => [product];
}
