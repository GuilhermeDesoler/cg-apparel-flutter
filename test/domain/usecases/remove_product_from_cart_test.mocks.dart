// Mocks generated by Mockito 5.4.2 from annotations
// in cg_apparel/test/domain/usecases/remove_product_from_cart_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:cg_apparel/core/error/failures.dart' as _i5;
import 'package:cg_apparel/domain/entities/cart.dart' as _i6;
import 'package:cg_apparel/domain/entities/product.dart' as _i7;
import 'package:cg_apparel/domain/repositories/cart_repository.dart' as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CartRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCartRepository extends _i1.Mock implements _i3.CartRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Cart>> getCart() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCart,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Cart>>.value(
            _FakeEither_0<_i5.Failure, _i6.Cart>(
          this,
          Invocation.method(
            #getCart,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Cart>>.value(
                _FakeEither_0<_i5.Failure, _i6.Cart>(
          this,
          Invocation.method(
            #getCart,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Cart>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> addProductToCart(
          _i7.Product? produt) =>
      (super.noSuchMethod(
        Invocation.method(
          #addProductToCart,
          [produt],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #addProductToCart,
            [produt],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, void>>.value(
                _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #addProductToCart,
            [produt],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> removeProductFromCart(
          _i7.Product? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeProductFromCart,
          [product],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #removeProductFromCart,
            [product],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, void>>.value(
                _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #removeProductFromCart,
            [product],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}
