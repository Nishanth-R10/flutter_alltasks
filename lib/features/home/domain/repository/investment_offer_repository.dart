// // lib/features/home/infrastructure/investment_offer_repository.dart
// import 'package:fpdart/fpdart.dart';
// import 'package:tasks/core/network/api_service.dart';
// import 'package:tasks/features/home/domain/entities/investment_offer_entity.dart';

// class InvestmentOfferRepository {
//   final ApiService _apiService;

//   InvestmentOfferRepository(this._apiService);

//   Future<Either<String, List<InvestmentOfferEntity>>> getInvestmentOffers() async {
//     try {
//       print('🔄 Fetching investment offers from API...');
      
//       // Simulate separate investment offers API
//       await Future.delayed(const Duration(milliseconds: 700));
      
//       // Dummy Investment API Response
//       final investmentOffers = [
//         InvestmentOfferEntity(
//           id: "invest_1",
//           title: "Invest & Earn",
//           description: "Grow your wealth with smart investments",
//           imageUrl: "",
//           offerType: "invest",
//           iconAsset: "assets/images/inevest.jpg",
//           discountText: null,
//         ),
//       ];
      
//       print('✅ Investment Offers API Success: ${investmentOffers.length} offers loaded');
//       return Right(investmentOffers);
      
//     } catch (e) {
//       print('❌ Investment Offers API Error: $e');
//       return Left('Failed to load investment offers: $e');
//     }
//   }
// }