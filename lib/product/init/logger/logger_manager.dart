import 'package:logger/logger.dart';

import '../../../core/init/logger/i_logger_manager.dart';

class LoggerManager implements ILoggerManager {
  static LoggerManager? _instance;

  static LoggerManager get instance => _instance ??= LoggerManager._internal();

    final Logger _logger;

  LoggerManager._internal()
      : _logger = Logger(
          printer: PrettyPrinter(
            methodCount: 1,
            errorMethodCount: 5,
            lineLength: 50,
            printTime: true,
          ),
          level: Level.warning,
        );

  @override
  void debug(String message, [error, StackTrace? stackTrace]) {
    _logger.d(message, error, stackTrace);
  }

  @override
  void error(String message, [error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }

  @override
  void info(String message, [error, StackTrace? stackTrace]) {
    _logger.i(message, error, stackTrace);
  }

  @override
  void verbose(String message, [error, StackTrace? stackTrace]) {
    _logger.v(message, error, stackTrace);
  }

  @override
  void warning(String message, [error, StackTrace? stackTrace]) {
    _logger.w(message, error, stackTrace);
  }

  @override
  void whtf(String message, [error, StackTrace? stackTrace]) {
    _logger.wtf(message, error, stackTrace);
  }
}
