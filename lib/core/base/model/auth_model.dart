import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  @JsonKey(name: 'access_token')
  String token;

  AuthModel({
    required this.token,
  });

  factory AuthModel.fromJson(Map<String, Object?> json) {
    return _$AuthModelFromJson(json);
  }

  AuthModel fromJson(Map<String, Object?> json) {
    return _$AuthModelFromJson(json);
  }

  Map<String, Object?> toJson() {
    return _$AuthModelToJson(this);
  }
}
