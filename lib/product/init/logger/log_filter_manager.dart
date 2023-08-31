import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LogFilterManager extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (event.level == Level.debug || event.level == Level.error) {
      return true;
    }
    if (kDebugMode) {
      return true;
    }
    return false;
  }
}
