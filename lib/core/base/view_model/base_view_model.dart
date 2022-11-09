import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../product/constants/navigation/navigation_constants.dart';
import '../../../product/init/logger/logger_manager.dart';
import '../../../product/init/storage/shared_pref_manager.dart';

abstract class BaseViewModel extends ChangeNotifier {
  late final BuildContext viewModelContext;

  final LoggerManager logger = LoggerManager.instance;

  final SharedPrefManager storageManager = SharedPrefManager.instance;

  String get serviceNullText => 'Bir Hata Oluştu. Lütfen Daha Sonra Tekrar Deneyiniz.';

  BaseViewModel() {
    logger.info('${runtimeType.toString()} initialize');
  }

  void setContext(BuildContext context);
  void init();

  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void onExit() {
    viewModelContext.navigateName(NavigationConstants.splashRoute);
  }
}
