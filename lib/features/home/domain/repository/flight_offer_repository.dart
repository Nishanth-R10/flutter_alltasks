// // lib/features/home/infrastructure/flight_offer_repository.dart
// import 'package:fpdart/fpdart.dart';
// import 'package:tasks/core/network/api_service.dart';
// import 'package:tasks/features/home/domain/entities/flight_offer_entity.dart';

// class FlightOfferRepository {
//   final ApiService _apiService;

//   FlightOfferRepository(this._apiService);

//   Future<Either<String, List<FlightOfferEntity>>> getFlightOffers() async {
//     try {
//       print(' Fetching flight offers from API...');
      
//       // Simulate separate flight offers API
//       await Future.delayed(const Duration(seconds: 1));
      
//       // Dummy Flight API Response
//       final flightOffers = [
//         FlightOfferEntity(
//           id: "flight_1",
//           title: "Offers on Flight Booking",
//           description: "Get exclusive discounts on flight bookings",
//           imageUrl: "",
//           offerType: "flights",
//           iconAsset: "assets/images/flight.png",
//           discountText: "20% OFF",
//         ),
//       ];
      
//       print(' Flight Offers API Success: ${flightOffers.length} offers loaded');
//       return Right(flightOffers);
      
//     } catch (e) {
//       print(' Flight Offers API Error: $e');
//       return Left('Failed to load flight offers: $e');
//     }
//   }
// }