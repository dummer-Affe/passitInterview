import 'package:mobx/mobx.dart';
import 'package:passit/product/init/extensions/response_model.dart';
import 'package:passit/product/model/dummy_products/models/dummy_product_model.dart';

import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/init/enum/service_status.dart';
import '../../../product/model/dummy_products/dummy_products_response.dart';

part 'dummy_product_model.g.dart';

class DummyProductViewModel = _DummyProductViewModelBase
    with _$DummyProductViewModel;

abstract class _DummyProductViewModelBase with Store {
  DummyProductsResponse? recommendedProducts;
  DummyProductResponse? product;

  @observable
  ServiceStatus productServiceStatus = ServiceStatus.waiting;

  @observable
  ServiceStatus recommendedProductsServiceStatus = ServiceStatus.waiting;

  String? productId;

  Future<void> init(productId) async {
    clear();
    this.productId = productId;
    await getProduct();
  }

  void clear() {
    recommendedProducts = null;
    product = null;
    productServiceStatus = ServiceStatus.waiting;
    recommendedProductsServiceStatus = ServiceStatus.waiting;
  }

  @action
  Future<void> getCategoryProducts() async {
    if (product != null && product!.category != null && productId != null) {
      var response = await AppSettings.instance.generalService
          .getProducts(product!.category!);

      switch (response.responseType) {
        case ResponseType.hasData:
          recommendedProducts = response.data!;
          recommendedProducts!.products!.removeWhere(
            (element) => element.id == int.parse(productId!),
          );
          recommendedProductsServiceStatus =
              recommendedProducts!.products != null
                  ? ServiceStatus.success
                  : ServiceStatus.failed;

          break;
        case ResponseType.errorModelWithData:
          recommendedProductsServiceStatus = ServiceStatus.failed;
          break;
        case ResponseType.errorModelWithoutData:
          recommendedProductsServiceStatus = ServiceStatus.failed;
          break;
        case ResponseType.noConnection:
          recommendedProductsServiceStatus = ServiceStatus.failed;
          break;
        case ResponseType.unknown:
          recommendedProductsServiceStatus = ServiceStatus.failed;
          break;
      }
    } else {
      recommendedProductsServiceStatus = ServiceStatus.failed;
    }
  }

  @action
  Future<void> getProduct() async {
    if (productId != null) {
      var response =
          await AppSettings.instance.generalService.getProduct(productId!);

      switch (response.responseType) {
        case ResponseType.hasData:
          product = response.data;
          productServiceStatus = ServiceStatus.success;
          getCategoryProducts();
        case ResponseType.errorModelWithData:
          productServiceStatus = ServiceStatus.failed;
          break;
        case ResponseType.errorModelWithoutData:
          productServiceStatus = ServiceStatus.failed;
          break;
        case ResponseType.noConnection:
          productServiceStatus = ServiceStatus.failed;
          break;
        case ResponseType.unknown:
          productServiceStatus = ServiceStatus.failed;
          break;
      }
    } else {
      productServiceStatus = ServiceStatus.failed;
    }
  }
}
