// ignore_for_file: always_use_package_imports

import '../../base/model/base_storage_model.dart';
import '../user_subscription/i_user_subscription.dart';

abstract class IStorageManager implements IUserSubscription {
  Future<void> initialize();

  Future<void> write<T extends BaseStorageModel<T>>({required T parseModel});
  Future<T?> read<T extends BaseStorageModel<T>>({required T parseModel});
  Future<List<T>> readAll<T extends BaseStorageModel<T>>({
    required T parseModel,
  });
  Future<void> delete<T extends BaseStorageModel<T>>({
    required T parseModel,
  });
}
