// lib/features/home/domain/entities/gold_offer_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gold_offer_entity.freezed.dart';
part 'gold_offer_entity.g.dart';

@freezed
class GoldOfferEntity with _$GoldOfferEntity {
  const factory GoldOfferEntity({
    required String id,
    required String title,
    required String description,
    required String imageUrl,
    required String offerType,
    required String iconAsset,
    String? discountText,
  }) = _GoldOfferEntity;

  factory GoldOfferEntity.fromJson(Map<String, dynamic> json) =>
      _$GoldOfferEntityFromJson(json);
}