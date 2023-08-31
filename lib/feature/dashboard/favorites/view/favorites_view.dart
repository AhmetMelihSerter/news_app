import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:news_app/core/base/view/base_view.dart';
import 'package:news_app/core/utils/date_format_utils.dart';
import 'package:news_app/feature/dashboard/favorites/view_model/favorites_view_model.dart';
import 'package:news_app/product/components/app_bar/custom_app_bar.dart';
import 'package:news_app/product/components/network_image/custom_image_network.dart';
import 'package:news_app/product/constants/locale/local_keys.g.dart';
import 'package:provider/provider.dart';

@RoutePage()
class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<FavoritesViewModel>(
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(viewModel),
        );
      },
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: Text(
        LocaleKeys.home_favorites_view_app_bar_title.tr(),
      ),
    );
  }

  Widget _buildBody(FavoritesViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _buildFavoritesList(),
        ],
      ),
    );
  }

  Widget _buildFavoritesList() {
    return Expanded(
      child: Consumer<FavoritesViewModel>(
        builder: (context, viewModel, child) => ListView.separated(
          itemCount: viewModel.favoritesList.length,
          separatorBuilder: (context, index) => _buildSeparator(),
          itemBuilder: (_, index) {
            return _buildListItem(context, index, viewModel);
          },
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
    FavoritesViewModel viewModel,
  ) {
    final model = viewModel.favoritesList[index];
    return InkWell(
      onTap: () => viewModel.onNewsDetail(index),
      child: Container(
        height: context.sized.dynamicHeight(.15),
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
            ),
            Row(
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
            ),
            Row(
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
                    DateFormatUtils.newsDateFormat(model.publishedAt),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
