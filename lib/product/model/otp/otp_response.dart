import 'package:json_annotation/json_annotation.dart';

import '../error/project_error_model.dart';

part 'otp_response.g.dart';

@JsonSerializable()
class OtpResponse {
  String? data;
  ProjectErrorModel? error;
  OtpResponse({this.data, this.error});

  OtpResponse fromJson(Map<String, dynamic> json) {
    return _$OtpResponseFromJson(json);
  }

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return _$OtpResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OtpResponseToJson(this);
  }
}
