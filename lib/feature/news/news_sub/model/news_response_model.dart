import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model_response.dart';
import '../../../_model/articles_model.dart';
part 'news_response_model.g.dart';

@JsonSerializable()
class NewsResponseModel extends BaseModelResponse<NewsResponseModel> {
  int? totalResults;
  List<ArticlesModel>? articles;

  NewsResponseModel({
    super.status,
    this.totalResults,
    this.articles,
  });

  factory NewsResponseModel.fromJson(Map<String, Object?> json) {
    return _$NewsResponseModelFromJson(json);
  }

  @override
  NewsResponseModel fromJson(Map<String, Object?> json) {
    return _$NewsResponseModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$NewsResponseModelToJson(this);
  }
}
