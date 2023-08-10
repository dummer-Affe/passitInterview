import 'package:json_annotation/json_annotation.dart';

import '../error/project_error_model.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message, data, status;
  ProjectErrorModel? error;

  LoginResponse({
    this.message,
    this.status,
    this.data,
    this.error,
  });

  LoginResponse fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginResponseToJson(this);
  }
}
