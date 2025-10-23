// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      location: json['location'] as String,
      id: json['id'] as String,
      phone: json['phone'] as String?,
      joinDate: json['joinDate'] as String?,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'location': instance.location,
      'id': instance.id,
      'phone': instance.phone,
      'joinDate': instance.joinDate,
      'profileImage': instance.profileImage,
    };
