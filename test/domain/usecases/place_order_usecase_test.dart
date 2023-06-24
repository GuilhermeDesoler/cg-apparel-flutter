import 'package:cg_apparel/domain/entities/cart.dart';
import 'package:cg_apparel/domain/entities/product.dart';
import 'package:cg_apparel/domain/repositories/order_repository.dart';
import 'package:cg_apparel/domain/usecases/place_order_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'place_order_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<OrderRepository>()])
void main() {
  late MockOrderRepository mockOrderRepository;
  late PlaceOrderUsecase placeOrderUsecase;

  setUp(() {
    mockOrderRepository = MockOrderRepository();
    placeOrderUsecase = PlaceOrderUsecase(repository: mockOrderRepository);
  });

  const tProduct = Product(
    id: 'hafjkhaskf',
    name: 'Produto teste',
    description: 'deve ser testado',
    price: 12.50,
    imageUrl: 'shuiasfhuas',
  );
  final tCart = Cart(products: List.generate(5, (_) => tProduct));

  test('Should place an order for the respective cart to the OrderRepository',
      () async {
    // arrange
    when(mockOrderRepository.placeOrder(tCart));
    // act
    placeOrderUsecase(PlarOrderParams(cart: tCart));
    // assert
    verify(mockOrderRepository.placeOrder(tCart));
  });
}
