import 'general_error_model.dart';

class ResponseModel<T, E> {
  T? data;
  ErrorModel<E?>? error;
  ResponseModel({this.data, this.error});
}
