// lib/features/home/infrastructure/offer_repository.dart
import 'package:tasks/features/home/domain/entities/offer_entity.dart';

class OfferRepository {
  List<OfferEntity> getOffers() {
    return [
      OfferEntity(
        id: "1",
        title: "Offers on Flight Booking",
        description: "Get exclusive discounts on flight bookings",
        imageUrl: "",
        offerType: "flights",
        iconAsset: "assets/images/flight.png",
        discountText: "20% OFF",
      ),
      OfferEntity(
        id: "2", 
        title: "Invest in Gold",
        description: "Secure your future with gold investments",
        imageUrl: "",
        offerType: "gold",
        iconAsset: "assets/images/gold-bars.jpg",
        // discountText: "15% OFF",
      ),
      OfferEntity(
        id: "3",
        title: "Tours & Attractions", 
        description: "Explore amazing destinations",
        imageUrl: "",
        offerType: "tours",
        iconAsset: "assets/images/tourist.jpg",
        // discountText: "25% OFF",
      ),
      OfferEntity(
        id: "4",
        title: "Invest & Earn",
        description: "Grow your wealth with smart investments",
        imageUrl: "", 
        offerType: "invest",
        iconAsset: "assets/images/inevest.jpg",
        // discountText: "20% OFF",
      ),
    ];
  }
}