// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whats_new_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WhatsNewEntityImpl _$$WhatsNewEntityImplFromJson(Map<String, dynamic> json) =>
    _$WhatsNewEntityImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imagePath: json['image_path'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$WhatsNewEntityImplToJson(
  _$WhatsNewEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'image_path': instance.imagePath,
  'type': instance.type,
};
