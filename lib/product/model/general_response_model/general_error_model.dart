class ErrorModel<T> {
  int? statusCode;
  String? description;
  T model;
  ErrorModel(this.statusCode, this.description, this.model);
}
