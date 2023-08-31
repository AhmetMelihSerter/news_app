import 'package:flutter/material.dart';

abstract class INavigationService {
  GlobalKey<NavigatorState> get navigatorKey;

  BuildContext? get context => navigatorKey.currentContext;

  Future<void> navigateToNamed({required String path, Object? data});
  Future<void> navigateToPage<T extends Object>({
    required T route,
    Object? data,
  });
  Future<void> navigateToPageClear<T extends Object>({
    required T route,
    Object? data,
  });
  Future<void> navigateHome<T extends Object>({List<T>? routes});
  Future<void> replaceAll<T extends Object>({required List<T> routes});
  Future<void> pushAll<T extends Object>({required List<T> routes});
  RouterDelegate<Object>? routerDelegate({
    List<NavigatorObserver> navigatorObservers,
  });
  RouteInformationParser<Object>? routeInformationParser();
  void pop();
  void unAuthorized();
}
