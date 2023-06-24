import 'package:cg_apparel/domain/entities/product.dart';
import 'package:cg_apparel/domain/repositories/cart_repository.dart';
import 'package:cg_apparel/domain/usecases/remove_product_from_cart_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remove_product_from_cart_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CartRepository>()])
void main() {
  late MockCartRepository mockCartRepository;
  late RemoveProductFromCartUsecase removeProductFromCartUsecase;

  setUp(() {
    mockCartRepository = MockCartRepository();
    removeProductFromCartUsecase =
        RemoveProductFromCartUsecase(repository: mockCartRepository);
  });

  const tProduct = Product(
    id: 'hafjkhaskf',
    name: 'Produto teste',
    description: 'deve ser testado',
    price: 12.50,
    imageUrl: 'shuiasfhuas',
  );

  test('Should remove the respective product from the CartRepository',
      () async {
    // arrange
    when(mockCartRepository.removeProductFromCart(tProduct));
    // act
    removeProductFromCartUsecase(
        const RemoveProductFromCartParams(product: tProduct));
    // assert
    verify(mockCartRepository.removeProductFromCart(tProduct));
  });
}
