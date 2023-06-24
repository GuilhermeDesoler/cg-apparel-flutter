import 'dart:convert';

import 'package:cg_apparel/data/models/product_model.dart';
import 'package:cg_apparel/domain/entities/product.dart';
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

  test('Should be a subclass of ProductEntity', () async {
    // assert
    expect(tProductModel, isA<Product>());
  });

  group('fromJson', () {
    test('Should returna valid User JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('product.json'));
      // act
      final result = ProductModel.fromJson(jsonMap);
      // assert
      expect(result, tProductModel);
    });
  });

  group('toJson', () {
    test('Should return a JSON map containing the proper data', () async {
      // act
      final result = tProductModel.toJson();
      // assert
      final expectedMap = {
        'id': '12345',
        'name': 'Guilherme Lima Desoler',
        'description': 'teste',
        'price': 17.50,
        'imageUrl': 'url',
      };

      expect(result, expectedMap);
    });
  });
}
