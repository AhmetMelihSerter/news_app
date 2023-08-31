import 'package:news_app/core/base/service/base_service.dart';
import 'package:news_app/core/init/storage/i_storage_manager.dart';
import 'package:news_app/feature/_model/articles_model.dart';

abstract class IFavoritesService extends BaseService {
  IFavoritesService(super.manager, this.storage);

  final IStorageManager storage;

  Future<List<ArticlesModel>> getAllFavorites();
  Future<void> addFavorites(ArticlesModel model);
  Future<void> deleteFavorites(ArticlesModel model);
}
