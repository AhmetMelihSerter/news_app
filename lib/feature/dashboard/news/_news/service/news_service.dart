import 'package:injectable/injectable.dart';

import 'package:news_app/feature/dashboard/news/_news/model/news_request_model.dart';
import 'package:news_app/feature/dashboard/news/_news/model/news_response_model.dart';
import 'package:news_app/feature/dashboard/news/_news/service/i_news_service.dart';

@Injectable(as: INewsService)
class NewsService extends INewsService {
  NewsService(super.networkManager);

  String get _getAllNewsRoute => 'everything';

  @override
  Future<NewsResponseModel?> searchNews(NewsRequestModel model) async {
    final response = await manager.send<NewsResponseModel>(
      _getAllNewsRoute,
      parseModel: NewsResponseModel(),
      queryParameters: model.toJson(),
    );
    return response;
  }
}
