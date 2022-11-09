import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view_model/base_view_model.dart';

class NewsSourceViewModel extends BaseViewModel {
  late final URLRequest initialUrlRequest;

  InAppWebViewController? webViewController;

  late final PullToRefreshController pullToRefreshController;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    final url = ModalRoute.of(viewModelContext)!.settings.arguments as String;
    initialUrlRequest = URLRequest(
      url: Uri.parse(url),
    );
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (viewModelContext.isAndroidDevice) {
          webViewController?.reload();
        } else if (viewModelContext.isIOSDevice) {
          webViewController?.loadUrl(
            urlRequest: URLRequest(
              url: await webViewController?.getUrl(),
            ),
          );
        }
      },
    );
  }

  void onLoadStart(InAppWebViewController controller, Uri? url) {
    logger.debug('Page started loading: $url');
  }

  void onPageFinished(InAppWebViewController controller, Uri? url) {
    logger.debug('Page finished loading: $url');
    pullToRefreshController.endRefreshing();
  }
}
