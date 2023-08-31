import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:news_app/core/base/model/base_model.dart';

part 'source_model.g.dart';

@JsonSerializable()
class SourceModel extends BaseModel<SourceModel> with EquatableMixin {
  SourceModel({
    this.id,
    this.name,
  });

  factory SourceModel.fromJson(Map<String, Object?> json) {
    return _$SourceModelFromJson(json);
  }

  final String? id;
  final String? name;

  @override
  SourceModel fromJson(Map<String, Object?> json) {
    return _$SourceModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$SourceModelToJson(this);
  }

  @override
  List<Object?> get props => [id];

  SourceModel copyWith({
    String? id,
    String? name,
  }) {
    return SourceModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
