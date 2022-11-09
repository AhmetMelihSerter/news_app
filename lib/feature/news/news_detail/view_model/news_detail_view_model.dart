import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../product/constants/navigation/navigation_constants.dart';
import '../../../_model/articles_model.dart';

class NewsDetailViewModel extends BaseViewModel {
  late final ArticlesModel articlesModel;

  bool isFavorite = false;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    articlesModel = ModalRoute.of(viewModelContext)!.settings.arguments as ArticlesModel;
    Future.microtask(() {
      _checkFavorites();
      notifyListeners();
    });
  }

  void _checkFavorites() {
    final favoritesList = storageManager.getAllFavorites();

    isFavorite = favoritesList.map((e) => e.url).contains(articlesModel.url);
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

  void _addFavorites() {
    storageManager.addFavorites(articlesModel);
  }

  void _deleteFavorites() {
    storageManager.deleteFavorites(articlesModel);
  }

  void shareNews() {
    if (articlesModel.url == null) {
      return;
    }
    Share.share(articlesModel.url!);
  }

  void onSource() {
    if (articlesModel.url == null) {
      return;
    }
    viewModelContext.navigateName(
      NavigationConstants.newsSourceRoute,
      data: articlesModel.url!,
    );
  }
}
