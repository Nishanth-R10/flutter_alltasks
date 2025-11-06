// // lib/features/home/infrastructure/tour_offer_repository.dart
// import 'package:fpdart/fpdart.dart';
// import 'package:tasks/core/network/api_service.dart';
// import 'package:tasks/features/home/domain/entities/tour_offer_entity.dart';

// class TourOfferRepository {
//   final ApiService _apiService;

//   TourOfferRepository(this._apiService);

//   Future<Either<String, List<TourOfferEntity>>> getTourOffers() async {
//     try {
//       print('🔄 Fetching tour offers from API...');
      
//       // Simulate separate tour offers API
//       await Future.delayed(const Duration(milliseconds: 600));
      
//       // Dummy Tour API Response
//       final tourOffers = [
//         TourOfferEntity(
//           id: "tour_1",
//           title: "Tours & Attractions",
//           description: "Explore amazing destinations",
//           imageUrl: "",
//           offerType: "tours",
//           iconAsset: "assets/images/tourist.jpg",
//           discountText: null,
//         ),
//       ];
      
//       print('✅ Tour Offers API Success: ${tourOffers.length} offers loaded');
//       return Right(tourOffers);
      
//     } catch (e) {
//       print('❌ Tour Offers API Error: $e');
//       return Left('Failed to load tour offers: $e');
//     }
//   }
// }