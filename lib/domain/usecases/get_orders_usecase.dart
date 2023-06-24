import 'package:dartz/dartz.dart' hide Order;
import 'package:equatable/equatable.dart';

import 'package:cg_apparel/core/error/failures.dart';

import '../../core/usecases/usecase.dart';
import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrdersUsecase implements Usecase<List<Order>, GetOrdersParams> {
  GetOrdersUsecase({
    required this.orderRepository,
  });

  final OrderRepository orderRepository;

  @override
  Future<Either<Failure, List<Order>>> call(GetOrdersParams params) async {
    return await orderRepository.getOrders(params.userId);
  }
}

class GetOrdersParams extends Equatable {
  const GetOrdersParams({
    required this.userId,
  });

  final String userId;

  @override
  List<Object?> get props => [userId];
}
