import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/init/navigation/i_navigation_service.dart';
import 'package:news_app/product/init/navigation/navigation_router.dart';

@Singleton(as: INavigationService)
class AutoRouterManager extends INavigationService {
  final navigationRouter = NavigationRouter();

  @override
  GlobalKey<NavigatorState> get navigatorKey => navigationRouter.navigatorKey;

  @override
  Future<void> navigateToNamed({
    required String path,
    Object? data,
  }) async {
    await navigationRouter.pushNamed(path);
  }

  @override
  Future<void> navigateToPage<T extends Object>({
    required T route,
    Object? data,
  }) async {
    await navigationRouter.push(route as PageRouteInfo);
  }

  @override
  Future<void> navigateToPageClear<T extends Object>({
    required T route,
    Object? data,
  }) async {
    await replaceAll(routes: [route]);
  }

  @override
  Future<void> navigateHome<T extends Object>({List<T>? routes}) async {
    await navigationRouter.replaceAll([
      const DashboardRoute(),
      ...?routes as List<PageRouteInfo>?,
    ]);
  }

  @override
  Future<void> replaceAll<T extends Object>({required List<T> routes}) async {
    await navigationRouter.replaceAll(routes as List<PageRouteInfo>);
  }

  @override
  Future<void> pushAll<T extends Object>({required List<T> routes}) async {
    await navigationRouter.pushAll(routes as List<PageRouteInfo>);
  }

  @override
  void pop() {
    navigationRouter.pop();
  }

  @override
  void unAuthorized() {
    replaceAll(
      routes: [
        const SplashRoute(),
      ],
    );
  }

  @override
  RouterDelegate<Object>? routerDelegate({
    List<NavigatorObserver>? navigatorObservers,
  }) {
    return navigationRouter.delegate(
      navigatorObservers: () => navigatorObservers ?? [],
    );
  }

  @override
  RouteInformationParser<Object>? routeInformationParser() {
    return navigationRouter.defaultRouteParser();
  }
}
