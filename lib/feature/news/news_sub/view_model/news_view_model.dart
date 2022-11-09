import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../product/constants/navigation/navigation_constants.dart';
import '../../../../product/constants/product/product_constants.dart';
import '../model/news_request_model.dart';
import '../model/news_response_model.dart';
import '../service/i_news_service.dart';

class NewsViewModel extends BaseViewModel {
  final INewsService _service;

  NewsViewModel(this._service);

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
      _newsRequestModel?.page += 1;
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
    viewModelContext.navigateName(
      NavigationConstants.newsDetailRoute,
      data: _newsModel!.articles![index],
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
    } catch (e) {
      logger.error('Error: $e');
    } finally {
      setLoading(false);
    }
  }

  void onChangedSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(viewModelContext.durationLow, () {
      _newsRequestModel = NewsRequestModel(
        q: query,
        apiKey: ProductConstants.apiKey,
      );
      _searchNews.call();
    });
  }

  void onDispose() {
    _debounce?.cancel();
  }
}
