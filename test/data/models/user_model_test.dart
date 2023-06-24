import 'dart:convert';

import 'package:cg_apparel/data/models/user_model.dart';
import 'package:cg_apparel/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixtures_reader.dart';

void main() {
  const tUserModel = UserModel(
    id: '12345',
    name: 'Guilherme Lima Desoler',
    email: 'guilherme.desoler@gmail.com',
  );

  test('Should be a subclass of UserEntity', () async {
    // assert
    expect(tUserModel, isA<User>());
  });

  group('fromJson', () {
    test('Should returna valid User JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('user.json'));
      // act
      final result = UserModel.fromJson(jsonMap);
      // assert
      expect(result, tUserModel);
    });
  });

  group('toJson', () {
    test('Should return a JSON map containing the proper data', () async {
      // act
      final result = tUserModel.toJson();
      // assert
      final expectedMap = {
        'id': '12345',
        'name': 'Guilherme Lima Desoler',
        'email': 'guilherme.desoler@gmail.com',
      };

      expect(result, expectedMap);
    });
  });
}
