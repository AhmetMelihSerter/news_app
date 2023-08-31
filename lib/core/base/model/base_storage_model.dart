// ignore_for_file: always_use_package_imports

import 'package:uuid/uuid.dart';
import '../model/base_model.dart';

abstract class BaseStorageModel<T> extends BaseModel<T> {
  BaseStorageModel({String? identity})
      : _identity = identity ?? const Uuid().v4();

  String get tableName => '$runtimeType';
  final String _identity;

  String get identity => _identity;
}
