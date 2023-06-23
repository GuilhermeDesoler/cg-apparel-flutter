import 'package:dartz/dartz.dart' hide Order;

import '../../core/error/failures.dart';
import '../entities/order.dart';
import '../entities/cart.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<Order>>> getOrders(String userId);
  Future<Either<Failure, void>> placeOrder(Cart cart);
}
