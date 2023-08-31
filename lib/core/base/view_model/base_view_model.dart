// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';

import '../../../core/init/logger/i_logger_manager.dart';
import '../../../core/init/navigation/i_navigation_service.dart';
import '../../../product/init/startup/startup_manager.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BaseViewModel() {
    logger.info('$runtimeType initialize');
  }

  late final BuildContext viewModelContext;

  ILoggerManager get logger => getIt<ILoggerManager>();

  INavigationService get navigationService => getIt<INavigationService>();

  void setContext(BuildContext context);
  void init();

  void onExit() {
    navigationService.unAuthorized();
  }
}
