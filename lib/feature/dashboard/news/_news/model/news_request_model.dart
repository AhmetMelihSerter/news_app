import 'package:json_annotation/json_annotation.dart';

import 'package:news_app/core/base/model/base_model.dart';
import 'package:news_app/product/constants/product/product_constants.dart';

part 'news_request_model.g.dart';

@JsonSerializable()
class NewsRequestModel extends BaseModel<NewsRequestModel> {
  NewsRequestModel({
    required this.q,
    this.page = 1,
  }) : _apiKey = ProductConstants.apiKey;

  factory NewsRequestModel.fromJson(Map<String, Object?> json) {
    return _$NewsRequestModelFromJson(json);
  }

  final String q;
  final int page;
  @JsonKey(name: 'apiKey', includeToJson: true)
  final String _apiKey;

  @override
  NewsRequestModel fromJson(Map<String, Object?> json) {
    return _$NewsRequestModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$NewsRequestModelToJson(this);
  }

  NewsRequestModel copyWith({
    String? q,
    int? page,
  }) {
    return NewsRequestModel(
      q: q ?? this.q,
      page: page ?? this.page,
    );
  }
}
