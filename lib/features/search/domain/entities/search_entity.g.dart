// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchEntityImpl _$$SearchEntityImplFromJson(Map<String, dynamic> json) =>
    _$SearchEntityImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      imagePath: json['image_path'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$SearchEntityImplToJson(_$SearchEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'image_path': instance.imagePath,
      'description': instance.description,
    };
