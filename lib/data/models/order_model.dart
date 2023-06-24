import 'package:cg_apparel/data/models/product_model.dart';
import 'package:cg_apparel/data/models/user_model.dart';
import 'package:cg_apparel/domain/entities/order.dart';

class OrderModel extends Order {
  const OrderModel({
    required String id,
    required UserModel user,
    required List<ProductModel> products,
    required double totalAmount,
    required DateTime dateTime,
  }) : super(
          id: id,
          user: user,
          products: products,
          totalAmount: totalAmount,
          dateTime: dateTime,
        );

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      user: UserModel.fromJson(json['user']),
      products: List.from(json['products'])
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      totalAmount: json['totalAmount'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
}
