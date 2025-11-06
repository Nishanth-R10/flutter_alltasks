// // lib/features/home/infrastructure/gold_offer_repository.dart
// import 'package:fpdart/fpdart.dart';
// import 'package:tasks/core/network/api_service.dart';
// import 'package:tasks/features/home/domain/entities/gold_offer_entity.dart';

// class GoldOfferRepository {
//   final ApiService _apiService;

//   GoldOfferRepository(this._apiService);

//   Future<Either<String, List<GoldOfferEntity>>> getGoldOffers() async {
//     try {
//       print('🔄 Fetching gold offers from API...');
      
//       // Simulate separate gold offers API
//       await Future.delayed(const Duration(milliseconds: 800));
      
//       // Dummy Gold API Response
//       final goldOffers = [
//         GoldOfferEntity(
//           id: "gold_1",
//           title: "Invest in Gold",
//           description: "Secure your future with gold investments",
//           imageUrl: "",
//           offerType: "gold",
//           iconAsset: "assets/images/gold-bars.jpg",
//           discountText: null,
//         ),
//       ];
      
//       print('✅ Gold Offers API Success: ${goldOffers.length} offers loaded');
//       return Right(goldOffers);
      
//     } catch (e) {
//       print('❌ Gold Offers API Error: $e');
//       return Left('Failed to load gold offers: $e');
//     }
//   }
// }