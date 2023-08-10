import '../../model/error/project_error_model.dart';
import '../../model/general_response_model/general_response.dart';

extension ResponseExtension on ResponseModel<dynamic, ProjectErrorModel?> {
  bool get hasError => error != null;
  bool get hasData => data != null;
  bool get hasErrorModel => error != null && error!.model != null;
  bool get connectionError =>
      hasErrorModel && error!.model!.noConnection == true;
  ProjectErrorModel? get errorModel =>
      error != null && error!.model != null ? error!.model : null;

  ResponseType get responseType {
    if (hasData) {
      return ResponseType.hasData;
    } else if (connectionError) {
      return ResponseType.noConnection;
    } else if (hasErrorModel) {
      var errorModel = error!.model!;
      return errorModel.data == null
          ? ResponseType.errorModelWithoutData
          : ResponseType.errorModelWithData;
    } else {
      return ResponseType.unknown;
    }
  }
}

enum ResponseType {
  noConnection,
  errorModelWithoutData,
  errorModelWithData,
  hasData,
  unknown
}
