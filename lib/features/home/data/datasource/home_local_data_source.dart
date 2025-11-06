import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/home/domain/entities/offer_entity.dart';
import 'package:tasks/features/home/domain/entities/referral_entity.dart';
import 'package:tasks/features/home/domain/entities/rewards_entity.dart';

class HomeLocalDataSource {
  Future<Either<String, List<OfferEntity>>> getOffers() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate loading
    
    try {
      final offers = [
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
          discountText: "15% OFF",
        ),
        OfferEntity(
          id: "3",
          title: "Tours & Attractions", 
          description: "Explore amazing destinations",
          imageUrl: "",
          offerType: "tours",
          iconAsset: "assets/images/tourist.jpg",
          discountText: "25% OFF",
        ),
      ];
      
      print('✅ LOCAL: Loaded ${offers.length} offers');
      return Right(offers);
    } catch (e) {
      print('❌ LOCAL: Error loading offers: $e');
      return Left('Local data error: $e');
    }
  }

  Future<Either<String, RewardsEntity>> getRewards() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Right(RewardsEntity(
      totalPoints: 1500,
      pointsEarned: 1285,
      progressPercentage: 0.65,
      amountAway: 240.0,
      nextRewardThreshold: 1000.0,
    ));
  }

  Future<Either<String, ReferralEntity>> getReferrals() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Right(ReferralEntity(
      referralCode: 'FRIEND2024',
      rewardPoints: 50,
      totalEarnings: 1250.0,
      friendsReferred: 8,
    ));
  }
}