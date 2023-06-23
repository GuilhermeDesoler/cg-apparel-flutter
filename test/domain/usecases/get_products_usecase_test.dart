import 'package:cg_apparel/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:cg_apparel/domain/repositories/product_repository.dart';
import 'package:cg_apparel/domain/usecases/get_products_usecase.dart';
import 'package:cg_apparel/domain/entities/product.dart';

import 'get_products_usecase_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository mockProductRepository;
  late GetProductsUsecase getProductsUsecase;

  setUp(() {
    mockProductRepository = MockProductRepository();
    getProductsUsecase =
        GetProductsUsecase(productRepository: mockProductRepository);
  });

  const tProduct = Product(
    id: 'hafjkhaskf',
    name: 'Produto teste',
    description: 'deve ser testado',
    price: 12.50,
    imageUrl: 'shuiasfhuas',
  );

  final tProductsList = List.generate(5, (_) => tProduct);

  test('Should get Product list from the ProductRepository', () async {
    // arrange
    when(mockProductRepository.getProducts())
        .thenAnswer((_) async => Right(tProductsList));
    // act
    final result = await getProductsUsecase(NoParams());
    // assert
    expect(result, equals(Right(tProductsList)));
    verify(mockProductRepository.getProducts());
  });
}
