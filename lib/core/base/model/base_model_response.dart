import 'base_model.dart';

abstract class BaseModelResponse<T> extends BaseModel<T> {
  String? status;

  BaseModelResponse({this.status});

  @override
  String toString() => 'BaseModelResponse(status: $status)';
}
