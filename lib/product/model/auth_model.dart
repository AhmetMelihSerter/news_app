import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:news_app/core/base/model/base_auth_model.dart';

part 'auth_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class AuthModel extends BaseAuthModel<AuthModel> with EquatableMixin {
  AuthModel({
    super.identity,
    this.accessToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return _$AuthModelFromJson(json);
  }

  @HiveField(0)
  @JsonKey(name: 'token')
  String? accessToken;

  @HiveField(1)
  @override
  String get identity => super.identity;

  @override
  String get tableName => 'authentication';

  @override
  List<Object?> get props => [accessToken];

  @override
  String get token => accessToken ?? '';

  @override
  AuthModel fromJson(Map<String, dynamic> json) {
    return AuthModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AuthModelToJson(this);
  }

  @override
  String toString() => 'AuthModel(accessToken: $accessToken)';
}
