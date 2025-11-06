// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_offer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoldOfferEntityImpl _$$GoldOfferEntityImplFromJson(
  Map<String, dynamic> json,
) => _$GoldOfferEntityImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  imageUrl: json['imageUrl'] as String,
  offerType: json['offerType'] as String,
  iconAsset: json['iconAsset'] as String,
  discountText: json['discountText'] as String?,
);

Map<String, dynamic> _$$GoldOfferEntityImplToJson(
  _$GoldOfferEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'imageUrl': instance.imageUrl,
  'offerType': instance.offerType,
  'iconAsset': instance.iconAsset,
  'discountText': instance.discountText,
};
