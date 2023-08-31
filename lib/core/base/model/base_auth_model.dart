// ignore_for_file: always_use_package_imports

import '../model/base_storage_model.dart';

abstract class BaseAuthModel<T> extends BaseStorageModel<T> {
  BaseAuthModel({super.identity});
  String get token;
}
