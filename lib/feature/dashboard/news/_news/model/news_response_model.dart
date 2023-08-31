import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/core/base/model/base_model_response.dart';
import 'package:news_app/feature/_model/articles_model.dart';

part 'news_response_model.g.dart';

@JsonSerializable()
class NewsResponseModel extends BaseModelResponse<NewsResponseModel> {
  NewsResponseModel({
    super.status,
    this.totalResults,
    this.articles,
  });

  factory NewsResponseModel.fromJson(Map<String, Object?> json) {
    return _$NewsResponseModelFromJson(json);
  }
  
  final int? totalResults;
  final List<ArticlesModel>? articles;

  @override
  NewsResponseModel fromJson(Map<String, Object?> json) {
    return _$NewsResponseModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$NewsResponseModelToJson(this);
  }
}
