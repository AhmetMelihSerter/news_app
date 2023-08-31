// ignore_for_file: always_use_package_imports

import 'base_model.dart';

abstract class BaseModelResponse<T> extends BaseModel<T> {
  BaseModelResponse({this.status});
  String? status;

  @override
  String toString() => 'BaseModelResponse(status: $status)';
}
