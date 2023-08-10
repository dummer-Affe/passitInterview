// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DummyCategoriesResponse _$DummyCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    DummyCategoriesResponse(
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
      error: json['error'] == null
          ? null
          : ProjectErrorModel.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DummyCategoriesResponseToJson(
        DummyCategoriesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
    };
