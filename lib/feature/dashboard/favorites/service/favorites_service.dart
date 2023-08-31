import 'package:injectable/injectable.dart';

import 'package:news_app/feature/_model/articles_model.dart';
import 'package:news_app/feature/dashboard/favorites/service/i_favorites_service.dart';

@Injectable(as: IFavoritesService)
class FavoritesService extends IFavoritesService {
  FavoritesService(super.manager, super.storage);

  @override
  Future<List<ArticlesModel>> getAllFavorites() async {
    final data = storage.readAll<ArticlesModel>(
      parseModel: ArticlesModel(),
    );
    return data;
  }

  @override
  Future<void> addFavorites(ArticlesModel model) async {
    await storage.write<ArticlesModel>(
      parseModel: model,
    );
  }

  @override
  Future<void> deleteFavorites(ArticlesModel model) async {
    await storage.delete<ArticlesModel>(
      parseModel: model,
    );
  }
}
