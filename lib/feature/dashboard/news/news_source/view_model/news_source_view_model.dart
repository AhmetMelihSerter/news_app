import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:kartal/kartal.dart';

import 'package:news_app/core/base/view_model/base_view_model.dart';

class NewsSourceViewModel extends BaseViewModel {
  late final URLRequest initialUrlRequest;

  InAppWebViewController? webViewController;

  late final PullToRefreshController pullToRefreshController;

  late final String _url;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  void setArgs(String value) {
    _url = value;
  }

  @override
  void init() {
    initialUrlRequest = URLRequest(
      url: Uri.parse(_url),
    );
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: _onRefresh,
    );
  }

  Future<void> _onRefresh() async {
    if (viewModelContext.device.isAndroidDevice) {
      await webViewController?.reload();
    } else if (viewModelContext.device.isIOSDevice) {
      await webViewController?.loadUrl(
        urlRequest: URLRequest(
          url: await webViewController?.getUrl(),
        ),
      );
    }
  }

  void onLoadStart(InAppWebViewController controller, Uri? url) {
    logger.debug('Page started loading: $url');
  }

  void onPageFinished(InAppWebViewController controller, Uri? url) {
    logger.debug('Page finished loading: $url');
    pullToRefreshController.endRefreshing();
  }
}
