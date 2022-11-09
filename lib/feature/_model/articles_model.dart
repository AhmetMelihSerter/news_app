import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';
import 'source_model.dart';

part 'articles_model.g.dart';

@JsonSerializable()
class ArticlesModel extends BaseModel<ArticlesModel> {
  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticlesModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticlesModel.fromJson(Map<String, Object?> json) {
    return _$ArticlesModelFromJson(json);
  }

  @override
  ArticlesModel fromJson(Map<String, Object?> json) {
    return _$ArticlesModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$ArticlesModelToJson(this);
  }
}
