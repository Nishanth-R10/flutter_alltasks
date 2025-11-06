// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferEntityImpl _$$OfferEntityImplFromJson(Map<String, dynamic> json) =>
    _$OfferEntityImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      primaryButtonText: json['primaryButtonText'] as String,
      secondaryButtonText: json['secondaryButtonText'] as String,
      showDontShowAgain: json['showDontShowAgain'] as bool,
      creditLimit: json['creditLimit'] as String,
      cardType: json['cardType'] as String,
      eligibility: json['eligibility'] as String,
      validUntil: json['validUntil'] as String?,
    );

Map<String, dynamic> _$$OfferEntityImplToJson(_$OfferEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'primaryButtonText': instance.primaryButtonText,
      'secondaryButtonText': instance.secondaryButtonText,
      'showDontShowAgain': instance.showDontShowAgain,
      'creditLimit': instance.creditLimit,
      'cardType': instance.cardType,
      'eligibility': instance.eligibility,
      'validUntil': instance.validUntil,
    };
