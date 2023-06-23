import 'package:cg_apparel/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({
    required this.products,
  });

  @override
  List<Object?> get props => [products];
}
