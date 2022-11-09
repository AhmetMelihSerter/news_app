import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../storage/shared_pref_manager.dart';

class StartupManager {
  static final StartupManager _instance = StartupManager._internal();

  static StartupManager get instance => _instance;

  StartupManager._internal();

  Future<void> initialize() async {
    /// EasyLocalization Initialize
    await EasyLocalization.ensureInitialized();

    /// DotEnv Initialize
    await dotenv.load(fileName: '.env');

    /// StorageManager Initialize
    await SharedPrefManager.instance.initialize();
  }
}
