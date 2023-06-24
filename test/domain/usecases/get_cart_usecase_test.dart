import 'package:cg_apparel/core/usecases/usecase.dart';
import 'package:cg_apparel/domain/entities/cart.dart';
import 'package:cg_apparel/domain/entities/product.dart';
import 'package:cg_apparel/domain/repositories/cart_repository.dart';
import 'package:cg_apparel/domain/usecases/get_cart_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_cart_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CartRepository>()])
void main() {
  late MockCartRepository mockCartRepository;
  late GetCartUsecase getCartUsecase;

  setUp(() {
    mockCartRepository = MockCartRepository();
    getCartUsecase = GetCartUsecase(repository: mockCartRepository);
  });

  const tProduct = Product(
    id: 'hafjkhaskf',
    name: 'Produto teste',
    description: 'deve ser testado',
    price: 12.50,
    imageUrl: 'shuiasfhuas',
  );
  final tCart = Cart(products: List.generate(5, (_) => tProduct));

  test('Should get the chart from the CartRepository', () async {
    // arrange
    when(mockCartRepository.getCart()).thenAnswer((_) async => Right(tCart));
    // act
    final result = await getCartUsecase(NoParams());
    // assert
    verify(mockCartRepository.getCart());
    expect(result, equals(Right(tCart)));
  });
}
