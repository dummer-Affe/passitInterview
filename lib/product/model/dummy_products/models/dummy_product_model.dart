import 'package:json_annotation/json_annotation.dart';

part 'dummy_product_model.g.dart';

@JsonSerializable()
class DummyProductResponse {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  DummyProductResponse(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});
      
  DummyProductResponse fromJson(Map<String, dynamic> json) {
    return _$DummyProductResponseFromJson(json);
  }

  factory DummyProductResponse.fromJson(Map<String, dynamic> json) {
    return _$DummyProductResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DummyProductResponseToJson(this);
  }
}
