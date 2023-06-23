import 'package:cg_apparel/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/cart.dart';
import '../entities/product.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> getCart();
  Future<Either<Failure, void>> addProductToCart(Product produt);
  Future<Either<Failure, void>> removeProductFromCart(Product product);
}
