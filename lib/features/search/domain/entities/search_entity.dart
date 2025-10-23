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
}