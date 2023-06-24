import 'package:cg_apparel/data/models/product_model.dart';
import 'package:cg_apparel/domain/entities/cart.dart';

class CartModel extends Cart {
  const CartModel({
    required List<ProductModel> products,
  }) : super(products: products);

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      products: List.from(json['products'])
          .map((e) => ProductModel.fromJson(e))
          .toList(),
    );
  }
}
