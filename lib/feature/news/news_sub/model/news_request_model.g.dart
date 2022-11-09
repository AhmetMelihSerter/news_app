// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsRequestModel _$NewsRequestModelFromJson(Map<String, dynamic> json) =>
    NewsRequestModel(
      q: json['q'] as String,
      page: json['page'] as int? ?? 1,
      apiKey: json['apiKey'] as String,
    );

Map<String, dynamic> _$NewsRequestModelToJson(NewsRequestModel instance) =>
    <String, dynamic>{
      'q': instance.q,
      'page': instance.page,
      'apiKey': instance.apiKey,
    };
