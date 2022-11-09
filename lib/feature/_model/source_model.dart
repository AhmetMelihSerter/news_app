import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';
part 'source_model.g.dart';

@JsonSerializable()
class SourceModel extends BaseModel<SourceModel> {
  String? id;
  String? name;

  SourceModel({
    this.id,
    this.name,
  });

  factory SourceModel.fromJson(Map<String, Object?> json) {
    return _$SourceModelFromJson(json);
  }

  @override
  SourceModel fromJson(Map<String, Object?> json) {
    return _$SourceModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$SourceModelToJson(this);
  }
}
