import 'package:flutter/material.dart';

import 'package:news_app/core/base/view_model/base_view_model.dart';
import 'package:news_app/feature/_model/articles_model.dart';
import 'package:news_app/feature/dashboard/favorites/service/i_favorites_service.dart';
import 'package:news_app/product/init/navigation/navigation_router.dart';

class FavoritesViewModel extends BaseViewModel {
  FavoritesViewModel(this._service);

  final IFavoritesService _service;

  List<ArticlesModel> _favoritesList = [];

  List<ArticlesModel> get favoritesList => _favoritesList;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    Future.microtask(() async {
      await _futureMikroTask();
    });
  }

  Future<void> _futureMikroTask() async {
    final tempList = await _service.getAllFavorites();
    _favoritesList = tempList.reversed.toList();
    notifyListeners();
  }

  Future<void> onNewsDetail(int index) async {
    await navigationService.navigateToPage(
      route: NewsDetailRoute(
        articlesModel: _favoritesList[index],
      ),
    );
    await _futureMikroTask();
  }
}
