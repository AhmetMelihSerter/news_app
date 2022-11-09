import 'package:flutter/material.dart';

import '../../../feature/favorites/view/favorites_view.dart';
import '../../../feature/home/view/home_view.dart';
import '../../../feature/news/news_detail/view/news_detail_view.dart';
import '../../../feature/news/news_source/view/news_source_view.dart';
import '../../../feature/news/news_sub/view/news_view.dart';
import '../../../feature/splash/view/splash_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRouter {
  static NavigationRouter? _instance;

  static NavigationRouter get instance => _instance ??= NavigationRouter._internal();

  NavigationRouter._internal();

  Route<dynamic> onGenerateRoute(RouteSettings? settings) {
    switch (settings!.name) {
      case NavigationConstants.splashRoute:
        return _normalNavigate(
          view: const SplashView(),
          pageName: NavigationConstants.splashRoute,
          settings: settings,
        );
      case NavigationConstants.homeRoute:
        return _normalNavigate(
          view: const HomeView(),
          pageName: NavigationConstants.homeRoute,
          settings: settings,
        );
      case NavigationConstants.newsRoute:
        return _normalNavigate(
          view: const NewsView(),
          pageName: NavigationConstants.newsRoute,
          settings: settings,
        );
      case NavigationConstants.favoritesRoute:
        return _normalNavigate(
          view: const FavoritesView(),
          pageName: NavigationConstants.favoritesRoute,
          settings: settings,
        );
      case NavigationConstants.newsDetailRoute:
        return _normalNavigate(
          view: const NewsDetailView(),
          pageName: NavigationConstants.newsDetailRoute,
          settings: settings,
        );
      case NavigationConstants.newsSourceRoute:
        return _normalNavigate(
          view: const NewsSourceView(),
          pageName: NavigationConstants.newsSourceRoute,
          settings: settings,
        );
      default:
        return _normalNavigate(
          view: const SplashView(),
          pageName: NavigationConstants.homeRoute,
          settings: settings,
        );
    }
  }

  MaterialPageRoute _normalNavigate({
    required Widget view,
    required String pageName,
    bool fullscreenDialog = false,
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(
      builder: (context) => view,
      fullscreenDialog: fullscreenDialog,
      settings: RouteSettings(
        name: pageName,
        arguments: settings!.arguments,
      ),
    );
  }
}
