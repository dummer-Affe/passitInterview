import 'package:json_annotation/json_annotation.dart';

import 'models/dummy_product_model.dart';

part 'dummy_products_response.g.dart';

@JsonSerializable()
class DummyProductsResponse {
  List<DummyProductResponse>? products;
  int? total;
  int? skip;
  int? limit;

  DummyProductsResponse({this.products, this.total, this.skip, this.limit});

  DummyProductsResponse fromJson(Map<String, dynamic> json) {
    return _$DummyProductsResponseFromJson(json);
  }

  factory DummyProductsResponse.fromJson(Map<String, dynamic> json) {
    return _$DummyProductsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DummyProductsResponseToJson(this);
  }
}
