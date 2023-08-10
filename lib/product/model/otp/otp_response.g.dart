// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpResponse _$OtpResponseFromJson(Map<String, dynamic> json) => OtpResponse(
      data: json['data'] as String?,
      error: json['error'] == null
          ? null
          : ProjectErrorModel.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtpResponseToJson(OtpResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
    };
