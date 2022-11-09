import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view_model/base_view_model.dart';
import '../../../product/constants/navigation/navigation_constants.dart';
import '../../_model/articles_model.dart';

class FavoritesViewModel extends BaseViewModel {
  List<ArticlesModel> _favoritesList = [];

  List<ArticlesModel> get favoritesList => _favoritesList;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    Future.microtask(() {
      _futureMikroTask();
    });
  }

  void _futureMikroTask() {
    _favoritesList = storageManager.getAllFavorites().reversed.toList();
    notifyListeners();
  }

  Future<void> onNewsDetail(int index) async {
    await viewModelContext.navigateName(
      NavigationConstants.newsDetailRoute,
      data: _favoritesList[index],
    );
    _futureMikroTask();
  }
}
