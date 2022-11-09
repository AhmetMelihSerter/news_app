import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view_model/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  late final PageController pageController;

  int pageIndex = 0;

  void setPageIndex(int index) {
    pageIndex = index;
    pageController.animateToPage(
      index,
      duration: viewModelContext.durationLow,
      curve: Curves.ease,
    );
    notifyListeners();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    pageController = PageController();
  }
}
