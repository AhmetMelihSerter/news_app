import '../../../../core/base/service/base_service.dart';
import '../model/news_request_model.dart';
import '../model/news_response_model.dart';

abstract class INewsService extends BaseService {
  INewsService(super.networkManager);

  Future<NewsResponseModel?> searchNews(NewsRequestModel model);
}
