import 'package:json_annotation/json_annotation.dart';

import '../error/project_error_model.dart';

part 'dummy_categories_response.g.dart';

@JsonSerializable()
class DummyCategoriesResponse {
  List<String>? data;
  ProjectErrorModel? error;

  DummyCategoriesResponse({
    this.data,
    this.error,
  });

  DummyCategoriesResponse fromJson(Map<String, dynamic> json) {
    return _$DummyCategoriesResponseFromJson(json);
  }

  factory DummyCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return _$DummyCategoriesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DummyCategoriesResponseToJson(this);
  }
}
