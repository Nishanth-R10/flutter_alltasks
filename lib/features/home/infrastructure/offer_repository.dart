// lib/features/dashboard/repository/offer_repository.dart
import '../domain/offer_entity.dart';

class OfferRepository {
  List<OfferEntity> getOffers() {
    return const [
      OfferEntity(
        title: "Offers on Flight Booking",
        iconAsset: "assets/images/flight.png",
        discountText: "20% Off",
      ),
      OfferEntity(
        title: "Invest in Gold",
        iconAsset: "assets/images/gold-bars.png",
      ),
      OfferEntity(
        title: "Tours & Attractions",
        iconAsset: "assets/images/tourist.png",
      ),
      OfferEntity(
        title: "Invest & Earn",
        iconAsset: "assets/images/inevest.png",
      ),
    ];
  }
}
