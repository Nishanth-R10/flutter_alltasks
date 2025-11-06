// import 'package:fpdart/fpdart.dart';
// import 'package:tasks/core/network/api_service.dart';
// import 'package:tasks/features/home/data/datasource/home_api_constants.dart';
// import 'package:tasks/features/home/domain/entities/offer_entity.dart';
// import 'package:tasks/features/home/domain/entities/referral_entity.dart';
// import 'package:tasks/features/home/domain/entities/rewards_entity.dart';

// class HomeRemoteDataSource {
//   final ApiService _apiService;

//   HomeRemoteDataSource(this._apiService);

//   // Get all home offers - FIXED to handle fallback data directly
//   Future<Either<String, List<OfferEntity>>> getOffers() async {
//     final result = await _apiService.get<List<dynamic>>(
//       HomeApiConstants.offers,
//       fromJson: (json) => json as List<dynamic>,
//       useFallback: true,
//     );

//     return result.fold(
//       (error) => Left(error),
//       (data) {
//         try {
//           // Convert the API response to OfferEntity list
//           final offers = data.map((item) {
//             if (item is Map<String, dynamic>) {
//               return OfferEntity.fromJson(item);
//             }
//             return OfferEntity(
//               id: "1",
//               title: "Fallback Offer",
//               description: "This is a fallback offer",
//               imageUrl: "",
//               offerType: "general",
//               iconAsset: "assets/images/fallback.png",
//               discountText: "10% OFF",
//             );
//           }).toList();
          
//           return Right(offers);
//         } catch (e) {
//           return Left('Failed to parse offers: $e');
//         }
//       },
//     );
//   }

//   // Get rewards data - FIXED
//   Future<Either<String, RewardsEntity>> getRewards() async {
//     final result = await _apiService.get<Map<String, dynamic>>(
//       HomeApiConstants.rewards,
//       fromJson: (json) => json,
//       useFallback: true,
//     );

//     return result.fold(
//       (error) => Left(error),
//       (data) => Right(RewardsEntity.fromJson(data)),
//     );
//   }

//   // Get referral data - FIXED
//   Future<Either<String, ReferralEntity>> getReferrals() async {
//     final result = await _apiService.get<Map<String, dynamic>>(
//       HomeApiConstants.referrals,
//       fromJson: (json) => json,
//       useFallback: true,
//     );

//     return result.fold(
//       (error) => Left(error),
//       (data) => Right(ReferralEntity.fromJson(data)),
//     );
//   }
// }