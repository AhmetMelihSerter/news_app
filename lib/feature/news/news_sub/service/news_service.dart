import 'package:vexana/vexana.dart';

import '../model/news_request_model.dart';
import '../model/news_response_model.dart';
import 'i_news_service.dart';

class NewsService extends INewsService {
  NewsService(super.networkManager);

  String get _getAllNewsRoute => 'everything';

  @override
  Future<NewsResponseModel?> searchNews(NewsRequestModel model) async {
    final response = await manager.send<NewsResponseModel, NewsResponseModel>(
      _getAllNewsRoute,
      parseModel: NewsResponseModel(),
      queryParameters: model.toJson(),
      method: RequestType.GET,
    );
    return response.data;
  }
}
