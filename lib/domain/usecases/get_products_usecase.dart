import 'package:dartz/dartz.dart';

import 'package:cg_apparel/core/error/failures.dart';
import 'package:cg_apparel/domain/repositories/product_repository.dart';

import '../../core/usecases/usecase.dart';
import '../entities/product.dart';

class GetProductsUsecase implements Usecase<List<Product>, NoParams> {
  GetProductsUsecase({
    required this.productRepository,
  });

  final ProductRepository productRepository;

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await productRepository.getProducts();
  }
}
