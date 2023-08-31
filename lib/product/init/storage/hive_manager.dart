import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/core/base/model/base_auth_model.dart';
import 'package:news_app/core/base/model/base_storage_model.dart';
import 'package:news_app/core/init/secure/i_secure_manager.dart';
import 'package:news_app/core/init/storage/i_storage_manager.dart';
import 'package:news_app/feature/_model/articles_model.dart';
import 'package:news_app/product/model/auth_model.dart';

@Singleton(as: IStorageManager)
class HiveManager extends IStorageManager {
  HiveManager(this._secureStorageManager);

  final ISecureManager _secureStorageManager;

  Box<T> _readBox<T extends BaseStorageModel<T>>(T model) =>
      Hive.box<T>(model.tableName);

  @override
  Future<void> write<T extends BaseStorageModel<T>>({
    required T parseModel,
  }) async {
    final box = _readBox(parseModel);
    await box.put(parseModel.identity, parseModel);
  }

  @override
  Future<T?> read<T extends BaseStorageModel<T>>({
    required T parseModel,
  }) async {
    final box = _readBox(parseModel);
    final result = box.get(parseModel.identity);
    return result;
  }

  @override
  Future<List<T>> readAll<T extends BaseStorageModel<T>>({
    required T parseModel,
  }) async {
    final box = _readBox(parseModel);
    return box.values.toList();
  }

  @override
  Future<void> delete<T extends BaseStorageModel<T>>({
    required T parseModel,
  }) async {
    final box = _readBox(parseModel);
    final deleteKey = box.keys.firstWhereOrNull(
      (element) => element == parseModel.identity,
    );
    if (deleteKey == null) {
      await _deleteWithIndex(box, parseModel: parseModel);
      return;
    }
    await box.delete(parseModel.identity);
  }

  Future<void> _deleteWithIndex<T>(Box<T> box, {required T parseModel}) async {
    final deleteIndex =
        box.values.toList().ext.indexOrNull((e) => e == parseModel);
    if (deleteIndex == null) {
      return;
    }
    await box.deleteAt(deleteIndex);
  }

  void _openBox<M extends BaseStorageModel<M>, T extends TypeAdapter<M>>(
    List<int> key,
    M model,
    T adapter,
  ) {
    Hive
      ..registerAdapter<M>(adapter)
      ..openBox<M>(
        model.tableName,
        encryptionCipher: HiveAesCipher(key),
      );
  }

  @override
  Future<void> initialize() async {
    await Hive.initFlutter();
    final key = await _secureStorageManager.readKey();
    _openBox(key, AuthModel(), AuthModelAdapter());
    _openBox(key, ArticlesModel(), ArticlesModelAdapter());
  }

  @override
  void createUser(BaseAuthModel<AuthModel> model) {
    _readBox(model).put(model.tableName, model);
  }

  @override
  void deleteUser() {
    final model = AuthModel();
    _readBox(model).delete(model.tableName);
  }
}
