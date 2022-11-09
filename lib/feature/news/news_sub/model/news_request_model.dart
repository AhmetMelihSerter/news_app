import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';

part 'news_request_model.g.dart';

@JsonSerializable()
class NewsRequestModel extends BaseModel<NewsRequestModel> {
  String q;
  int page;
  String apiKey;
  NewsRequestModel({
    required this.q,
    this.page = 1,
    required this.apiKey,
  });

  factory NewsRequestModel.fromJson(Map<String, Object?> json) {
    return _$NewsRequestModelFromJson(json);
  }

  @override
  NewsRequestModel fromJson(Map<String, Object?> json) {
    return _$NewsRequestModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$NewsRequestModelToJson(this);
  }
}
