// lib/features/dashboard/domain/offer_entity.dart
class OfferEntity {
  final String title;
  final String iconAsset;
  final String? discountText;

  const OfferEntity({
    required this.title,
    required this.iconAsset,
    this.discountText,
  });
}
