// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductsViewModel on _ProductsViewModelBase, Store {
  late final _$serviceStatusAtom =
      Atom(name: '_ProductsViewModelBase.serviceStatus', context: context);

  @override
  ServiceStatus get serviceStatus {
    _$serviceStatusAtom.reportRead();
    return super.serviceStatus;
  }

  @override
  set serviceStatus(ServiceStatus value) {
    _$serviceStatusAtom.reportWrite(value, super.serviceStatus, () {
      super.serviceStatus = value;
    });
  }

  late final _$productsStatusAtom =
      Atom(name: '_ProductsViewModelBase.productsStatus', context: context);

  @override
  ServiceStatus get productsStatus {
    _$productsStatusAtom.reportRead();
    return super.productsStatus;
  }

  @override
  set productsStatus(ServiceStatus value) {
    _$productsStatusAtom.reportWrite(value, super.productsStatus, () {
      super.productsStatus = value;
    });
  }

  late final _$maxPriceAtom =
      Atom(name: '_ProductsViewModelBase.maxPrice', context: context);

  @override
  double get maxPrice {
    _$maxPriceAtom.reportRead();
    return super.maxPrice;
  }

  @override
  set maxPrice(double value) {
    _$maxPriceAtom.reportWrite(value, super.maxPrice, () {
      super.maxPrice = value;
    });
  }

  late final _$searchAtom =
      Atom(name: '_ProductsViewModelBase.search', context: context);

  @override
  ObservableList<DummyProductResponse> get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(ObservableList<DummyProductResponse> value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: '_ProductsViewModelBase.selectedCategory', context: context);

  @override
  String? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$getCategoryProductsAsyncAction = AsyncAction(
      '_ProductsViewModelBase.getCategoryProducts',
      context: context);

  @override
  Future<void> getCategoryProducts() {
    return _$getCategoryProductsAsyncAction
        .run(() => super.getCategoryProducts());
  }

  late final _$updateCategoryAsyncAction =
      AsyncAction('_ProductsViewModelBase.updateCategory', context: context);

  @override
  Future<void> updateCategory(String category) {
    return _$updateCategoryAsyncAction
        .run(() => super.updateCategory(category));
  }

  late final _$_ProductsViewModelBaseActionController =
      ActionController(name: '_ProductsViewModelBase', context: context);

  @override
  void updateMaxPrice(double price) {
    final _$actionInfo = _$_ProductsViewModelBaseActionController.startAction(
        name: '_ProductsViewModelBase.updateMaxPrice');
    try {
      return super.updateMaxPrice(price);
    } finally {
      _$_ProductsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFilter() {
    final _$actionInfo = _$_ProductsViewModelBaseActionController.startAction(
        name: '_ProductsViewModelBase.resetFilter');
    try {
      return super.resetFilter();
    } finally {
      _$_ProductsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void runFilters() {
    final _$actionInfo = _$_ProductsViewModelBaseActionController.startAction(
        name: '_ProductsViewModelBase.runFilters');
    try {
      return super.runFilters();
    } finally {
      _$_ProductsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serviceStatus: ${serviceStatus},
productsStatus: ${productsStatus},
maxPrice: ${maxPrice},
search: ${search},
selectedCategory: ${selectedCategory}
    ''';
  }
}
