import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../enums/app_enum.dart';

class ApplicationConstants {
  ApplicationConstants._();

  static const String appName = 'News APP';

  static AppMode get appMode => kDebugMode ? AppMode.debug : AppMode.release;

  static String get baseUrl => dotenv.get('BASE_URL');
}
