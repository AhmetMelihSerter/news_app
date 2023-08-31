import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/init/secure/i_secure_manager.dart';
import 'package:news_app/core/init/storage/i_storage_manager.dart';
import 'package:news_app/product/init/startup/startup_manager.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
)
void getItInitialize() => getIt.init();

class StartupManager {
  static Future<void> initialize() async {
    /// EasyLocalization Initialize
    await EasyLocalization.ensureInitialized();

    /// DotEnv Initialize
    await dotenv.load();

    /// GetIt Initialize
    getItInitialize();

    /// SecureManager Initialize
    await getIt<ISecureManager>().initialize();

    /// StorageManager Initialize
    await getIt<IStorageManager>().initialize();
  }
}
