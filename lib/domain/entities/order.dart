import 'package:cg_apparel/domain/entities/product.dart';
import 'package:cg_apparel/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final User user;
  final List<Product> products;
  final double totalAmount;
  final DateTime dateTime;

  const Order({
    required this.id,
    required this.user,
    required this.products,
    required this.totalAmount,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [id, user, products, totalAmount, dateTime];
}
