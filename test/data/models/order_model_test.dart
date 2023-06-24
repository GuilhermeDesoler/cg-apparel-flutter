import 'dart:convert';

import 'package:cg_apparel/data/models/order_model.dart';
import 'package:cg_apparel/data/models/product_model.dart';
import 'package:cg_apparel/data/models/user_model.dart';
import 'package:cg_apparel/domain/entities/order.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixtures_reader.dart';

void main() {
  const tUser = UserModel(
    id: '12345',
    name: 'Guilherme Lima Desoler',
    email: 'guilherme.desoler@gmail.com',
  );
  const tProductModel = ProductModel(
    id: '12345',
    name: 'Guilherme Lima Desoler',
    description: 'teste',
    price: 17.50,
    imageUrl: 'url',
  );
  final tOrderModel = OrderModel(
    id: '123456',
    user: tUser,
    products: List.generate(2, (_) => tProductModel),
    totalAmount: 35.00,
    dateTime: DateTime(2023, 6, 24),
  );

  test('Should be a subclass of CartEntity', () async {
    // assert
    expect(tOrderModel, isA<Order>());
  });

  group('fromJson', () {
    test('Should returna valid Order JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('order.json'));
      // act
      final result = OrderModel.fromJson(jsonMap);
      // assert
      expect(result, tOrderModel);
    });
  });

  group('toJson', () {
    test('Should return a JSON map containing the proper data', () async {
      // act
      final result = tOrderModel.toJson();
      // assert
      final expectedMap = {
        'id': '123456',
        'user': {
          'id': '12345',
          'name': 'Guilherme Lima Desoler',
          'email': 'guilherme.desoler@gmail.com',
        },
        'products': [
          {
            'id': '12345',
            'name': 'Guilherme Lima Desoler',
            'description': 'teste',
            'price': 17.50,
            'imageUrl': 'url',
          },
          {
            'id': '12345',
            'name': 'Guilherme Lima Desoler',
            'description': 'teste',
            'price': 17.50,
            'imageUrl': 'url',
          },
        ],
        'totalAmount': 35.00,
        'dateTime': DateTime(2023, 6, 24).toIso8601String(),
      };

      expect(result, expectedMap);
    });
  });
}
