import 'dart:convert';

import 'package:cg_apparel/data/models/cart_model.dart';
import 'package:cg_apparel/data/models/product_model.dart';
import 'package:cg_apparel/domain/entities/cart.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixtures_reader.dart';

void main() {
  const tProductModel = ProductModel(
    id: '12345',
    name: 'Guilherme Lima Desoler',
    description: 'teste',
    price: 17.50,
    imageUrl: 'url',
  );
  final tCartModel =
      CartModel(products: List.generate(2, (_) => tProductModel));

  test('Should be a subclass of CartEntity', () async {
    // assert
    expect(tCartModel, isA<Cart>());
  });

  group('fromJson', () {
    test('Should returna valid User JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('cart.json'));
      // act
      final result = CartModel.fromJson(jsonMap);
      // assert
      expect(result, tCartModel);
    });
  });

  group('toJson', () {
    test('Should return a JSON map containing the proper data', () async {
      // act
      final result = tCartModel.toJson();
      // assert
      final expectedMap = {
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
      };

      expect(result, expectedMap);
    });
  });
}
