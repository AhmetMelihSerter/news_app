import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:news_app/core/base/view/base_view.dart';
import 'package:news_app/feature/dashboard/news/news_source/view_model/news_source_view_model.dart';
import 'package:news_app/product/components/app_bar/custom_app_bar.dart';
import 'package:news_app/product/constants/locale/local_keys.g.dart';

@RoutePage()
class NewsSourceView extends StatelessWidget {
  const NewsSourceView({
    super.key,
    required String url,
  }) : _url = url;

  final String _url;

  @override
  Widget build(BuildContext context) {
    return BaseView<NewsSourceViewModel>(
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..setArgs(_url)
          ..init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _buildAppBar(viewModel),
          body: _buildBody(viewModel),
        );
      },
    );
  }

  CustomAppBar _buildAppBar(NewsSourceViewModel viewModel) {
    return CustomAppBar(
      title: Text(
        LocaleKeys.home_news_source_view_app_bar_title.tr(),
      ),
    );
  }

  Widget _buildBody(NewsSourceViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InAppWebView(
        initialUrlRequest: viewModel.initialUrlRequest,
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
            mediaPlaybackRequiresUserGesture: false,
          ),
          android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
          ),
          ios: IOSInAppWebViewOptions(
            allowsInlineMediaPlayback: true,
          ),
        ),
        pullToRefreshController: viewModel.pullToRefreshController,
        onWebViewCreated: (controller) {
          viewModel.webViewController = controller;
        },
        onLoadStart: viewModel.onLoadStart,
        onLoadStop: viewModel.onPageFinished,
      ),
    );
  }
}
