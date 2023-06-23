import 'package:cg_apparel/domain/entities/order.dart';
import 'package:cg_apparel/domain/entities/product.dart';
import 'package:cg_apparel/domain/entities/user.dart';
import 'package:cg_apparel/domain/repositories/order_repository.dart';
import 'package:cg_apparel/domain/usecases/get_orders_usecase.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_orders_usecase_test.mocks.dart';

@GenerateMocks([OrderRepository])
void main() {
  late MockOrderRepository mockOrderRepository;
  late GetOrdersUsecase getOrdersUsecase;

  setUp(() {
    mockOrderRepository = MockOrderRepository();
    getOrdersUsecase = GetOrdersUsecase(orderRepository: mockOrderRepository);
  });

  const tUserId = 'sdasdaf';
  const tProduct = Product(
    id: 'hafjkhaskf',
    name: 'Produto teste',
    description: 'deve ser testado',
    price: 12.50,
    imageUrl: 'shuiasfhuas',
  );
  const tUser = User(
    id: tUserId,
    name: 'Guilherme',
    email: 'guilherme.desoler@gmail.com',
  );
  final tProductsList = List.generate(5, (_) => tProduct);
  final tOrder = Order(
    id: 'ashuaifshu',
    user: tUser,
    products: tProductsList,
    totalAmount: 62.50,
    dateTime: DateTime(2023),
  );
  final tOrdersList = List.generate(5, (_) => tOrder);

  test(
    'Should get Orders list from GetOrdersUsecase',
    () async {
      // arrange
      when(mockOrderRepository.getOrders(tUserId))
          .thenAnswer((_) async => Right(tOrdersList));
      // act
      final result =
          await getOrdersUsecase(const GetOrdersParams(userId: tUserId));
      // assert
      expect(result, equals(Right(tOrdersList)));
      verify(mockOrderRepository.getOrders(tUserId));
    },
  );
}
