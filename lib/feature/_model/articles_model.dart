import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kartal/kartal.dart';

import 'package:news_app/core/base/model/base_storage_model.dart';
import 'package:news_app/feature/_model/source_model.dart';

part 'articles_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class ArticlesModel extends BaseStorageModel<ArticlesModel>
    with EquatableMixin {
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
  final SourceModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  @JsonKey(fromJson: _clearHttp)
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  static String? _clearHttp(String? value) {
    if (value.ext.isNullOrEmpty) {
      return null;
    }
    return value!.replaceAll('https:////', 'https://').replaceAll('http:////', 'http://');
  }

  @override
  ArticlesModel fromJson(Map<String, Object?> json) {
    return _$ArticlesModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$ArticlesModelToJson(this);
  }

  @override
  List<Object?> get props => [title];

  ArticlesModel copyWith({
    SourceModel? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    return ArticlesModel(
      source: source ?? this.source,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }
}
