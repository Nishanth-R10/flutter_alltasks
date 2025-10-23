// lib/features/offers/domain/entities/offer_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_entity.freezed.dart';
part 'offer_entity.g.dart';

@freezed
class OfferEntity with _$OfferEntity {
  const factory OfferEntity({
    required String id,
    required String title,
    required String description,
    required String imageUrl, // Changed from imagePath to imageUrl
    required String primaryButtonText,
    required String secondaryButtonText,
    required bool showDontShowAgain,
    required String creditLimit,
    required String cardType,
    required String eligibility,
    String? validUntil,
  }) = _OfferEntity;

  factory OfferEntity.fromJson(Map<String, dynamic> json) =>
      _$OfferEntityFromJson(json);
}

extension OfferEntityExtensions on OfferEntity {
  bool get isExpired {
    if (validUntil == null) return false;
    final expiryDate = DateTime.tryParse(validUntil!);
    return expiryDate != null && expiryDate.isBefore(DateTime.now());
  }
  
  bool get isPreApproved => eligibility.toLowerCase().contains('pre-approved');
}