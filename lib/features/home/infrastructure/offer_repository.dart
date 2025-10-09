import 'package:tasks/core/constants/app_strings/default_string.dart';
import '../domain/offer_entity.dart';

class OfferRepository {
  List<OfferEntity> getOffers() {
    return [
      OfferEntity(
        title: DefaultString.instance.offersOnFlightBooking,
        iconAsset: "assets/images/flight.png",
        discountText: "20% ${DefaultString.instance.off}",
      ),
      OfferEntity(
        title: DefaultString.instance.investInGold,
        iconAsset: "assets/images/gold-bars.jpg",
      ),
      OfferEntity(
        title: DefaultString.instance.toursAttractions,
        iconAsset: "assets/images/tourist.jpg",
      ),
      OfferEntity(
        title: DefaultString.instance.investEarn,
        iconAsset: "assets/images/inevest.jpg",
      ),
    ];
  }
}