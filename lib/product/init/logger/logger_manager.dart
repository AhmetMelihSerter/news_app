import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'package:news_app/core/init/logger/i_logger_manager.dart';
import 'package:news_app/product/init/logger/log_filter_manager.dart';

@Singleton(as: ILoggerManager)
class LoggerManager extends ILoggerManager {
  LoggerManager()
      : _logger = Logger(
          printer: PrettyPrinter(
            methodCount: 1,
            errorMethodCount: 5,
            lineLength: 50,
            printTime: true,
          ),
          filter: LogFilterManager(),
        );

  final Logger _logger;

  @override
  void debug(String message, [StackTrace? stackTrace]) {
    _logger.d(message, null, stackTrace);
  }

  @override
  void error(String message, [StackTrace? stackTrace]) {
    _logger.e(message, null, stackTrace);
  }

  @override
  void info(String message, [StackTrace? stackTrace]) {
    _logger.i(message, null, stackTrace);
  }

  @override
  void verbose(String message, [StackTrace? stackTrace]) {
    _logger.v(message, null, stackTrace);
  }

  @override
  void warning(String message, [StackTrace? stackTrace]) {
    _logger.w(message, null, stackTrace);
  }

  @override
  void whtf(String message, [StackTrace? stackTrace]) {
    _logger.wtf(message, null, stackTrace);
  }
}
