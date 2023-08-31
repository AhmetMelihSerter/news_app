import 'package:news_app/core/base/service/base_service.dart';
import 'package:news_app/feature/dashboard/news/_news/model/news_request_model.dart';
import 'package:news_app/feature/dashboard/news/_news/model/news_response_model.dart';

abstract class INewsService extends BaseService {
  INewsService(super.networkManager);

  Future<NewsResponseModel?> searchNews(NewsRequestModel model);
}
