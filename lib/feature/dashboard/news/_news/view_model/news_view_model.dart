import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:news_app/core/base/view_model/base_view_model.dart';
import 'package:news_app/feature/dashboard/news/_news/model/news_request_model.dart';
import 'package:news_app/feature/dashboard/news/_news/model/news_response_model.dart';
import 'package:news_app/feature/dashboard/news/_news/service/i_news_service.dart';
import 'package:news_app/product/init/navigation/navigation_router.dart';

class NewsViewModel extends BaseViewModel {
  NewsViewModel(this._service);

  final INewsService _service;

  late final TextEditingController searchController;

  late final ScrollController listViewController;

  NewsResponseModel? _newsModel;

  NewsResponseModel? get newsModel => _newsModel;

  Timer? _debounce;

  NewsRequestModel? _newsRequestModel;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    searchController = TextEditingController();
    listViewController = ScrollController();
  }

  bool onScrollEndNotification(ScrollEndNotification notification) {
    if (notification.metrics.atEdge && notification.metrics.pixels != 0) {
      final lastPage = (_newsRequestModel?.page ?? 0) + 1;
      _newsRequestModel?.copyWith(
        page: lastPage,
      );
      _searchNews(isCountPage: true);
    }
    return true;
  }

  void onSearchClear() {
    searchController.clear();
    _newsModel = null;
    notifyListeners();
  }

  void onNewsDetail(int index) {
    navigationService.navigateToPage(
      route: NewsDetailRoute(
        articlesModel: _newsModel!.articles![index],
      ),
    );
  }

  Future<void> _searchNews({bool isCountPage = false}) async {
    try {
      if (_newsRequestModel == null) {
        return;
      }

      final responseModel = await _service.searchNews(
        _newsRequestModel!,
      );

      if (isCountPage) {
        _newsModel?.articles?.addAll(responseModel?.articles ?? []);
        return;
      }
      _newsModel = responseModel;
      notifyListeners();
    } catch (e) {
      logger.error('Error: $e');
    }
  }

  void onChangedSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(viewModelContext.duration.durationLow, () {
      _newsRequestModel = NewsRequestModel(
        q: query,
      );
      _searchNews.call();
    });
  }

  void onDispose() {
    _debounce?.cancel();
  }
}
