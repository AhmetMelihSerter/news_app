import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/utils/date_format_utils.dart';
import '../../../../product/components/app_bar/custom_app_bar.dart';
import '../../../../product/components/button/custom_outlined_button.dart';
import '../../../../product/constants/extensions/ui_extensions.dart';
import '../../../../product/constants/locale/local_keys.g.dart';
import '../view_model/news_detail_view_model.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<NewsDetailViewModel>(
      viewModel: NewsDetailViewModel(),
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
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
    return Image.network(
      viewModel.articlesModel.urlToImage ?? '',
    );
  }

  Widget _buildDescription(BuildContext context, NewsDetailViewModel viewModel) {
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
      viewModel.articlesModel.title ?? '',
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
                'Author ${viewModel.articlesModel.author}',
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
                DateFormatUtils.newsDateFormat(viewModel.articlesModel.publishedAt ?? ''),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, NewsDetailViewModel viewModel) {
    return SizedBox(
      height: context.dynamicHeight(.26),
      child: SingleChildScrollView(
        child: Text(
          '${viewModel.articlesModel.content}',
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
