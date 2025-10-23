// lib/features/home/infrastructure/rewards_repository.dart
import 'package:fpdart/fpdart.dart';
import 'package:tasks/core/network/api_service.dart';
import 'package:tasks/features/home/domain/entities/rewards_entity.dart';

class RewardsRepository {
  final ApiService _apiService;

  RewardsRepository(this._apiService);

  Future<Either<String, RewardsEntity>> getRewardsDetails() async {
    try {
      print(' Fetching rewards...');

      final result = await _apiService.get<Map<String, dynamic>>('/users/1');

      return result.fold(
        (error) {
          print(' API error, using fallback rewards');
          return Right(_getFallbackRewards());
        },
        (data) {
          // fallback 
          print(' Using fallback rewards data');
          return Right(_getFallbackRewards());
        },
      );
    } catch (e) {
      print('❌ Rewards error, using fallback: $e');
      return Right(_getFallbackRewards());
    }
  }

  RewardsEntity _getFallbackRewards() {
    return RewardsEntity(
      totalPoints: 1500,
      pointsEarned: 1285,
      progressPercentage: 0.65,
      amountAway: 240.0,
      nextRewardThreshold: 1000.0,
    );
  }
}