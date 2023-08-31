import 'package:flutter/material.dart';

import 'package:news_app/core/base/view_model/base_view_model.dart';
import 'package:news_app/feature/_model/articles_model.dart';
import 'package:news_app/feature/dashboard/favorites/service/i_favorites_service.dart';
import 'package:news_app/product/init/navigation/navigation_router.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetailViewModel extends BaseViewModel {
  NewsDetailViewModel(this._service);

  final IFavoritesService _service;

  late final ArticlesModel _articlesModel;

  bool isFavorite = false;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  void setArgs(ArticlesModel value) {
    _articlesModel = value;
  }

  @override
  void init() {
    Future.microtask(() async {
      await _checkFavorites();
    });
  }

  Future<void> _checkFavorites() async {
    final favoritesList = await _service.getAllFavorites();

    isFavorite = favoritesList.contains(_articlesModel);
    notifyListeners();
  }

  void onTapFavorites() {
    if (isFavorite) {
      _deleteFavorites();
    } else {
      _addFavorites();
    }
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> _addFavorites() async {
    await _service.addFavorites(_articlesModel);
  }

  Future<void> _deleteFavorites() async {
    await _service.deleteFavorites(_articlesModel);
  }

  void shareNews() {
    if (_articlesModel.url == null) {
      return;
    }
    Share.share(_articlesModel.url!);
  }

  void onSource() {
    if (_articlesModel.url == null) {
      return;
    }
    navigationService.navigateToPage(
      route: NewsSourceRoute(
        url: _articlesModel.url!,
      ),
    );
  }
}
