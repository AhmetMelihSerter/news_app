import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:news_app/core/base/view/base_view.dart';
import 'package:news_app/core/utils/date_format_utils.dart';
import 'package:news_app/feature/_model/articles_model.dart';
import 'package:news_app/feature/dashboard/news/news_detail/view_model/news_detail_view_model.dart';
import 'package:news_app/product/components/app_bar/custom_app_bar.dart';
import 'package:news_app/product/components/button/custom_outlined_button.dart';
import 'package:news_app/product/components/network_image/custom_image_network.dart';
import 'package:news_app/product/constants/extensions/ui_extensions.dart';
import 'package:news_app/product/constants/locale/local_keys.g.dart';
import 'package:provider/provider.dart';

@RoutePage()
class NewsDetailView extends StatelessWidget {
  const NewsDetailView({
    super.key,
    required ArticlesModel articlesModel,
  }) : _articlesModel = articlesModel;

  final ArticlesModel _articlesModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<NewsDetailViewModel>(
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..setArgs(_articlesModel)
          ..init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _buildAppBar(viewModel),
          body: _buildBody(context, viewModel),
        );
      },
    );
  }

  CustomAppBar _buildAppBar(NewsDetailViewModel viewModel) {
    return CustomAppBar(
      actions: [
        IconButton(
          icon: const Icon(
            Icons.ios_share,
          ),
          onPressed: viewModel.shareNews,
        ),
        Consumer<NewsDetailViewModel>(
          builder: (context, value, child) => IconButton(
            icon: Icon(
              viewModel.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: viewModel.onTapFavorites,
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, NewsDetailViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildImage(viewModel),
          _buildDescription(context, viewModel),
          _buildShowSource(viewModel),
        ],
      ),
    );
  }

  Widget _buildImage(NewsDetailViewModel viewModel) {
    return CustomImageNetwork(
      imageUrl: _articlesModel.urlToImage ?? '',
      width: .9,
      height: .3,
    );
  }

  Widget _buildDescription(
    BuildContext context,
    NewsDetailViewModel viewModel,
  ) {
    return Column(
      children: [
        _buildTitle(viewModel),
        _buildAuthor(viewModel),
        _buildContent(context, viewModel),
      ],
    );
  }

  Widget _buildTitle(NewsDetailViewModel viewModel) {
    return Text(
      _articlesModel.title ?? '',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAuthor(NewsDetailViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              const Icon(
                Icons.person,
              ),
              buildSpacer(width: .02),
              Text(
                'Author ${_articlesModel.author ?? ''}',
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.date_range,
              ),
              buildSpacer(width: .02),
              Text(
                DateFormatUtils.newsDateFormat(
                  _articlesModel.publishedAt ?? '',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, NewsDetailViewModel viewModel) {
    return SizedBox(
      height: context.sized.dynamicHeight(.26),
      child: SingleChildScrollView(
        child: Text(
          _articlesModel.content ?? '',
        ),
      ),
    );
  }

  Widget _buildShowSource(NewsDetailViewModel viewModel) {
    return CustomOutlinedButton(
      onPressed: viewModel.onSource,
      child: Text(
        LocaleKeys.home_news_detail_view_news_source_button.tr(),
      ),
    );
  }
}
