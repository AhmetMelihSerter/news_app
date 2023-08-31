import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:news_app/core/base/view_model/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    Future.microtask(() {
      Future.delayed(viewModelContext.duration.durationSlow, _onNavigateHome);
    });
  }

  void _onNavigateHome() {
    navigationService.navigateHome();
  }
}
