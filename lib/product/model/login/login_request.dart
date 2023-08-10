import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String? email, password;
  LoginRequest({this.email, this.password});

  LoginRequest fromJson(Map<String, dynamic> json) {
    return _$LoginRequestFromJson(json);
  }

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginRequestToJson(this);
  }
}
