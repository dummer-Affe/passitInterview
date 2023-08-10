import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String? username, email, password;
  String otp;
  RegisterRequest({this.email, this.password, this.username}) : otp = "123456";

  RegisterRequest fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestFromJson(json);
  }

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterRequestToJson(this);
  }
}
