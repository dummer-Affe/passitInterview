import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_error_model.g.dart';

@JsonSerializable()
class ProjectErrorModel {
  dynamic noConnection;
  DioExceptionType? type;
  String? message, data, status;

  ProjectErrorModel({this.data, this.type, this.message, this.status})
      : noConnection = false;
  ProjectErrorModel.nullData()
      : noConnection = false,
        type = DioExceptionType.unknown;
  ProjectErrorModel.noConnection()
      : noConnection = true,
        type = DioExceptionType.connectionError;

  ProjectErrorModel fromJson(Map<String, dynamic> json) {
    return _$ProjectErrorModelFromJson(json);
  }

  factory ProjectErrorModel.fromJson(Map<String, dynamic> json) {
    return _$ProjectErrorModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProjectErrorModelToJson(this);
  }
}
