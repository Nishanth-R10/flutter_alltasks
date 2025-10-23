// lib/features/search/domain/entities/whats_new_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'whats_new_entity.freezed.dart';
part 'whats_new_entity.g.dart';

@freezed
class WhatsNewEntity with _$WhatsNewEntity {
  const factory WhatsNewEntity({
    required String id,
    required String title,
    required String description,
  // ignore: invalid_annotation_target
  @JsonKey(name: 'image_path') required String imagePath,
    required String type,
  }) = _WhatsNewEntity;

  factory WhatsNewEntity.fromJson(Map<String, dynamic> json) =>
      _$WhatsNewEntityFromJson(json);
}