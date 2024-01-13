import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  int? id;
  String? name;
  String? description;
  String? cover_photo;
  dynamic parent;
  int? status;
  dynamic deleted_at;
  DateTime? created_at;
  DateTime? updated_at;

  CategoryModel({
    this.id,
    this.name,
    this.description,
    this.cover_photo,
    this.parent,
    this.status,
    this.deleted_at,
    this.created_at,
    this.updated_at,
  });

  CategoryModel copyWith({
    int? id,
    String? name,
    String? description,
    String? cover_photo,
    dynamic parent,
    int? status,
    dynamic deleted_at,
    DateTime? created_at,
    DateTime? updated_at,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        cover_photo: cover_photo ?? this.cover_photo,
        parent: parent ?? this.parent,
        status: status ?? this.status,
        deleted_at: deleted_at ?? this.deleted_at,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at ?? this.updated_at,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
