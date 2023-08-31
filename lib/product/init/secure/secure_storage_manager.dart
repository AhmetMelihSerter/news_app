import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/init/logger/i_logger_manager.dart';
import 'package:news_app/core/init/secure/i_secure_manager.dart';
import 'package:news_app/product/constants/product/product_constants.dart';

@Singleton(as: ISecureManager)
class SecureStorageManager extends ISecureManager {
  SecureStorageManager(this._loggerManager)
      : _secureKey = ProductConstants.SECURE_KEY;

  final ILoggerManager _loggerManager;

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  final String _secureKey;

  @override
  Future<void> initialize() async {
    final containsEncryptionKey = await _secureStorage.containsKey(
      key: _secureKey,
    );
    if (!containsEncryptionKey) {
      await createKey();
    }
  }

  @override
  Future<void> createKey() async {
    final encryptionKey = Hive.generateSecureKey();
    await _secureStorage.write(
      key: _secureKey,
      value: base64Url.encode(encryptionKey),
    );
  }

  @override
  Future<List<int>> readKey() async {
    final isSecureKey = await _secureStorage.containsKey(key: _secureKey);
    if (!isSecureKey) {
      _loggerManager.info('Secure key not found.');
      await createKey();
    }
    final key = await _secureStorage.read(key: _secureKey);
    return base64Url.decode(key!);
  }
}
