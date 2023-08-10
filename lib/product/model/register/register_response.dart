import 'package:json_annotation/json_annotation.dart';

import '../error/project_error_model.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  String? message, data, status;
  ProjectErrorModel? error;

  RegisterResponse({
    this.message,
    this.status,
    this.data,
    this.error,
  });

  RegisterResponse fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseFromJson(json);
  }

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterResponseToJson(this);
  }
}
