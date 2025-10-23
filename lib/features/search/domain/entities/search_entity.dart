<<<<<<< HEAD
// lib/features/search/domain/entities/search_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_entity.freezed.dart';
part 'search_entity.g.dart';

@freezed
class SearchEntity with _$SearchEntity {
  const factory SearchEntity({
    required String id,
    required String title,
    required String type,
  // ignore: invalid_annotation_target
  @JsonKey(name: 'image_path') String? imagePath,
    String? description,
  }) = _SearchEntity;

  factory SearchEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchEntityFromJson(json);
=======
class SearchEntity {
  final String title;
  final String imagePath;
  final String id;
  final String type;

  SearchEntity({
    required this.title,
    required this.imagePath,
    required this.id,
    required this.type,
  });

  factory SearchEntity.fromJson(Map<String, dynamic> json) {
    return SearchEntity(
      id: json['id']?.toString() ?? '',
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imagePath': imagePath,
      'type': type,
    };
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}