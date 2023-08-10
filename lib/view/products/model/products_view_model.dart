import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:passit/product/init/extensions/response_model.dart';
import 'package:passit/view/products/model/sort_by.dart';
import 'package:passit/view/products/view/filter_view.dart';

import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/init/enum/service_status.dart';
import '../../../product/model/dummy_products/models/dummy_product_model.dart';

part 'products_view_model.g.dart';

class ProductsViewModel = _ProductsViewModelBase with _$ProductsViewModel;

abstract class _ProductsViewModelBase with Store {
  @observable
  ServiceStatus serviceStatus = ServiceStatus.waiting;

  @observable
  ServiceStatus productsStatus = ServiceStatus.waiting;

  List<DummyProductResponse>? products;

  @observable
  double maxPrice = 5000;

  SortBy sortBy = SortBy.lowerToHigher;

  bool hasInitCategory = false;

  @observable
  ObservableList<DummyProductResponse> search =
      ObservableList<DummyProductResponse>.of([]);

  @observable
  String? selectedCategory;

  List<String>? categories;
  Future<void> init(String? selected) async {
    hasInitCategory = selected != null;
    selectedCategory = selected;
    getCategories();
  }

  Future<void> getCategories() async {
    serviceStatus = ServiceStatus.onProcess;
    var response = await AppSettings.instance.generalService.getCategories();
    switch (response.responseType) {
      case ResponseType.hasData:
        categories = response.data!.data;
        serviceStatus =
            categories != null ? ServiceStatus.success : ServiceStatus.failed;
        getCategoryProducts();
        break;
      case ResponseType.errorModelWithData:
        serviceStatus = ServiceStatus.failed;
        break;
      case ResponseType.errorModelWithoutData:
        serviceStatus = ServiceStatus.failed;
        break;
      case ResponseType.noConnection:
        serviceStatus = ServiceStatus.failed;
        break;
      case ResponseType.unknown:
        serviceStatus = ServiceStatus.failed;
        break;
    }
  }

  @action
  Future<void> getCategoryProducts() async {
    productsStatus = ServiceStatus.onProcess;
    var response = selectedCategory == null
        ? await AppSettings.instance.generalService.getAllProducts()
        : await AppSettings.instance.generalService
            .getProducts(selectedCategory!);

    switch (response.responseType) {
      case ResponseType.hasData:
        products = response.data!.products;
        runFilters();
        productsStatus =
            products != null ? ServiceStatus.success : ServiceStatus.failed;

        break;
      case ResponseType.errorModelWithData:
        productsStatus = ServiceStatus.failed;
        break;
      case ResponseType.errorModelWithoutData:
        productsStatus = ServiceStatus.failed;
        break;
      case ResponseType.noConnection:
        productsStatus = ServiceStatus.failed;
        break;
      case ResponseType.unknown:
        productsStatus = ServiceStatus.failed;
        break;
    }
  }

  @action
  void updateMaxPrice(double price) {
    maxPrice = price;
    runFilters();
  }

  @action
  void resetFilter() {
    maxPrice = 5000;
    sortBy = SortBy.lowerToHigher;
    if (selectedCategory != null) {
      selectedCategory = null;
      getCategoryProducts();
    } else {
      runFilters();
    }
  }

  void updateSortBy(String sortBy) {
    if (sortBy == SortBy.higherToLower.toText) {
      this.sortBy = SortBy.higherToLower;
    } else if (sortBy == SortBy.lowerToHigher.toText) {
      this.sortBy = SortBy.lowerToHigher;
    }
    runFilters();
  }

  @action
  Future<void> updateCategory(String category) async {
    selectedCategory = category;
    getCategoryProducts();
  }

  openFilter(
      {required BuildContext context, required ProductsViewModel model}) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        barrierColor: Colors.black.withOpacity(0.6),
        backgroundColor: const Color(0xFFE1E1E1),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: FilterView(model: model),
          );
        });
  }

  @action
  void runFilters() {
    productsStatus = ServiceStatus.onProcess;
    if (products != null) {
      if (sortBy == SortBy.higherToLower) {
        products!.sort((b, a) => a.price!.compareTo(b.price!));
      } else {
        products!.sort((a, b) => a.price!.compareTo(b.price!));
      }
      search.clear();
      search.addAll(
          products!.where((element) => element.price! < maxPrice).toList());
    }
    productsStatus = ServiceStatus.success;
  }
}
