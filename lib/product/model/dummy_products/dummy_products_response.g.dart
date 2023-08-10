// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DummyProductsResponse _$DummyProductsResponseFromJson(
        Map<String, dynamic> json) =>
    DummyProductsResponse(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => DummyProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$DummyProductsResponseToJson(
        DummyProductsResponse instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
