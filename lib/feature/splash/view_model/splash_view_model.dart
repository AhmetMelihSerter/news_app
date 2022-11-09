import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view_model/base_view_model.dart';
import '../../../product/constants/navigation/navigation_constants.dart';

class SplashViewModel extends BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    Future.microtask(() {
      Future.delayed(viewModelContext.durationSlow, _onNavigateHome);
    });
  }

  void _onNavigateHome() {
    viewModelContext.navigateToReset(NavigationConstants.homeRoute);
  }
}
