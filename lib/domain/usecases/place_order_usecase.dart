// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cg_apparel/core/error/failures.dart';
import 'package:cg_apparel/domain/repositories/order_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/usecases/usecase.dart';
import '../entities/cart.dart';

class PlaceOrderUsecase implements Usecase<void, PlarOrderParams> {
  PlaceOrderUsecase({
    required this.repository,
  });

  final OrderRepository repository;

  @override
  Future<Either<Failure, void>> call(PlarOrderParams params) async {
    return await repository.placeOrder(params.cart);
  }
}

class PlarOrderParams extends Equatable {
  const PlarOrderParams({
    required this.cart,
  });

  final Cart cart;

  @override
  List<Object?> get props => [cart];
}
