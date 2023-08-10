// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_product_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DummyProductViewModel on _DummyProductViewModelBase, Store {
  late final _$productServiceStatusAtom = Atom(
      name: '_DummyProductViewModelBase.productServiceStatus',
      context: context);

  @override
  ServiceStatus get productServiceStatus {
    _$productServiceStatusAtom.reportRead();
    return super.productServiceStatus;
  }

  @override
  set productServiceStatus(ServiceStatus value) {
    _$productServiceStatusAtom.reportWrite(value, super.productServiceStatus,
        () {
      super.productServiceStatus = value;
    });
  }

  late final _$recommendedProductsServiceStatusAtom = Atom(
      name: '_DummyProductViewModelBase.recommendedProductsServiceStatus',
      context: context);

  @override
  ServiceStatus get recommendedProductsServiceStatus {
    _$recommendedProductsServiceStatusAtom.reportRead();
    return super.recommendedProductsServiceStatus;
  }

  @override
  set recommendedProductsServiceStatus(ServiceStatus value) {
    _$recommendedProductsServiceStatusAtom
        .reportWrite(value, super.recommendedProductsServiceStatus, () {
      super.recommendedProductsServiceStatus = value;
    });
  }

  late final _$getCategoryProductsAsyncAction = AsyncAction(
      '_DummyProductViewModelBase.getCategoryProducts',
      context: context);

  @override
  Future<void> getCategoryProducts() {
    return _$getCategoryProductsAsyncAction
        .run(() => super.getCategoryProducts());
  }

  late final _$getProductAsyncAction =
      AsyncAction('_DummyProductViewModelBase.getProduct', context: context);

  @override
  Future<void> getProduct() {
    return _$getProductAsyncAction.run(() => super.getProduct());
  }

  @override
  String toString() {
    return '''
productServiceStatus: ${productServiceStatus},
recommendedProductsServiceStatus: ${recommendedProductsServiceStatus}
    ''';
  }
}
