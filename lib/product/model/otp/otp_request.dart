import 'package:json_annotation/json_annotation.dart';

part 'otp_request.g.dart';

@JsonSerializable()
class OtpRequest {
  int? otp;
  String? email;
  OtpRequest({this.otp, this.email});

  OtpRequest fromJson(Map<String, dynamic> json) {
    return _$OtpRequestFromJson(json);
  }

  factory OtpRequest.fromJson(Map<String, dynamic> json) {
    return _$OtpRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OtpRequestToJson(this);
  }
}
