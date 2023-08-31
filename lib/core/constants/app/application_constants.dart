// ignore_for_file: always_use_package_imports, constant_identifier_names

import 'package:flutter/foundation.dart';

import '../enums/app_enum.dart';

class ApplicationConstants {
  ApplicationConstants._();

  static const String APP_NAME = 'News APP';

  static AppMode get appMode => kDebugMode ? AppMode.debug : AppMode.release;

}
