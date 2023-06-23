import 'package:cg_apparel/core/error/failures.dart';
import 'package:cg_apparel/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
