// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectErrorModel _$ProjectErrorModelFromJson(Map<String, dynamic> json) =>
    ProjectErrorModel(
      data: json['data'] as String?,
      type: $enumDecodeNullable(_$DioExceptionTypeEnumMap, json['type']),
      message: json['message'] as String?,
      status: json['status'] as String?,
    )..noConnection = json['noConnection'];

Map<String, dynamic> _$ProjectErrorModelToJson(ProjectErrorModel instance) =>
    <String, dynamic>{
      'noConnection': instance.noConnection,
      'type': _$DioExceptionTypeEnumMap[instance.type],
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
    };

const _$DioExceptionTypeEnumMap = {
  DioExceptionType.connectionTimeout: 'connectionTimeout',
  DioExceptionType.sendTimeout: 'sendTimeout',
  DioExceptionType.receiveTimeout: 'receiveTimeout',
  DioExceptionType.badCertificate: 'badCertificate',
  DioExceptionType.badResponse: 'badResponse',
  DioExceptionType.cancel: 'cancel',
  DioExceptionType.connectionError: 'connectionError',
  DioExceptionType.unknown: 'unknown',
};
