// lib/features/home/domain/entities/tour_offer_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_offer_entity.freezed.dart';
part 'tour_offer_entity.g.dart';

@freezed
class TourOfferEntity with _$TourOfferEntity {
  const factory TourOfferEntity({
    required String id,
    required String title,
    required String description,
    required String imageUrl,
    required String offerType,
    required String iconAsset,
    String? discountText,
  }) = _TourOfferEntity;

  factory TourOfferEntity.fromJson(Map<String, dynamic> json) =>
      _$TourOfferEntityFromJson(json);
}