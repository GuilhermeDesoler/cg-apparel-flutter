import 'package:cg_apparel/domain/entities/product.dart';
import 'package:cg_apparel/domain/repositories/cart_repository.dart';
import 'package:cg_apparel/domain/usecases/add_product_to_cart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_product_to_cart_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CartRepository>()])
void main() {
  late MockCartRepository mockCartRepository;
  late AddPoductToCart addPoductToCart;

  setUp(() {
    mockCartRepository = MockCartRepository();
    addPoductToCart = AddPoductToCart(repository: mockCartRepository);
  });

  const tProduct = Product(
    id: 'hafjkhaskf',
    name: 'Produto teste',
    description: 'deve ser testado',
    price: 12.50,
    imageUrl: 'shuiasfhuas',
  );

  test('Should add the respective product to the cart from the CartRepository',
      () async {
    // arrange
    when(mockCartRepository.addProductToCart(tProduct));
    // act
    addPoductToCart(const AddPoductToCartParams(product: tProduct));
    // assert
    verify(mockCartRepository.addProductToCart(tProduct));
  });
}
