abstract class ILoggerManager {
  void verbose(String message, [StackTrace? stackTrace]);

  void debug(String message, [StackTrace? stackTrace]);

  void info(String message, [StackTrace? stackTrace]);

  void warning(String message, [StackTrace? stackTrace]);

  void error(String message, [StackTrace? stackTrace]);

  void whtf(String message, [StackTrace? stackTrace]);
}
