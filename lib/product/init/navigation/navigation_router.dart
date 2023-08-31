import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/feature/_model/articles_model.dart';
import 'package:news_app/feature/dashboard/_dashboard/dashboard_view.dart';

import 'package:news_app/feature/dashboard/favorites/view/favorites_view.dart';
import 'package:news_app/feature/dashboard/news/_news/view/news_view.dart';
import 'package:news_app/feature/dashboard/news/news_detail/view/news_detail_view.dart';
import 'package:news_app/feature/dashboard/news/news_source/view/news_source_view.dart';
import 'package:news_app/feature/splash/view/splash_view.dart';

part 'navigation_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class NavigationRouter extends _$NavigationRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: DashboardRoute.page,
          children: [
            AutoRoute(page: NewsRoute.page, initial: true),
            AutoRoute(page: FavoritesRoute.page, maintainState: false),
          ],
        ),
        AutoRoute(page: NewsDetailRoute.page),
        AutoRoute(page: NewsSourceRoute.page),
      ];
}
