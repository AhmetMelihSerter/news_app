import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:news_app/core/base/view/base_view.dart';
import 'package:news_app/feature/splash/view_model/splash_view_model.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          body: _buildBody(context),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: FlutterLogo(
        size: context.sized.dynamicHeight(.5),
      ),
    );
  }
}
