import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/core/base/view/base_view.dart';
import 'package:news_app/core/constants/app/application_constants.dart';
import 'package:news_app/core/utils/date_format_utils.dart';
import 'package:news_app/feature/_model/articles_model.dart';
import 'package:news_app/feature/dashboard/news/_news/view_model/news_view_model.dart';
import 'package:news_app/product/components/app_bar/custom_app_bar.dart';
import 'package:news_app/product/components/network_image/custom_image_network.dart';
import 'package:news_app/product/components/text_field/search_text_field.dart';
import 'package:news_app/product/constants/extensions/ui_extensions.dart';
import 'package:news_app/product/constants/locale/local_keys.g.dart';
import 'package:provider/provider.dart';

@RoutePage()
class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<NewsViewModel>(
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..init();
      },
      onDispose: (model) => model.onDispose(),
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(viewModel),
        );
      },
    );
  }

  CustomAppBar _buildAppBar() {
    return const CustomAppBar(
      title: Text(
        ApplicationConstants.APP_NAME,
      ),
    );
  }

  Widget _buildBody(NewsViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _buildSearch(viewModel),
          buildSpacer(height: .02),
          _buildNewsList(),
        ],
      ),
    );
  }

  Widget _buildSearch(NewsViewModel viewModel) {
    return SearchTextField(
      onChanged: viewModel.onChangedSearch,
      controller: viewModel.searchController,
      onClear: viewModel.onSearchClear,
      hintText: LocaleKeys.home_news_view_text_field_search.tr(),
    );
  }

  Widget _buildNewsList() {
    return Expanded(
      child: Consumer<NewsViewModel>(
        builder: (context, viewModel, child) =>
            NotificationListener<ScrollEndNotification>(
          onNotification: viewModel.onScrollEndNotification,
          child: ListView.separated(
            controller: viewModel.listViewController,
            itemCount: viewModel.newsModel?.articles?.length ?? 0,
            separatorBuilder: (context, index) => _buildSeparator(),
            itemBuilder: (_, index) {
              return _buildListItem(context, index, viewModel);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return const Divider(
      color: Colors.grey,
      height: 5,
    );
  }

  Widget _buildListItem(
    BuildContext context,
    int index,
    NewsViewModel viewModel,
  ) {
    final model = viewModel.newsModel!.articles![index];
    return InkWell(
      onTap: () => viewModel.onNewsDetail(index),
      child: Container(
        height: context.sized.dynamicHeight(.15),
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildListItemTitle(model),
            _buildListItemDescriptionAndImage(context, model),
            _buildListItemSourceAndDate(model),
          ],
        ),
      ),
    );
  }

  Widget _buildListItemTitle(ArticlesModel model) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            model.title ?? '',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListItemDescriptionAndImage(
    BuildContext context,
    ArticlesModel model,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            model.description ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        CustomImageNetwork(
          imageUrl: model.urlToImage ?? '',
        ),
      ],
    );
  }

  Widget _buildListItemSourceAndDate(ArticlesModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            model.source?.name ?? '',
          ),
        ),
        Flexible(
          child: Text(
            DateFormatUtils.newsDateFormat(model.publishedAt ?? ''),
          ),
        ),
      ],
    );
  }
}
