// lib/features/rewards/application/rewards_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/network/api_service.dart';
import 'package:tasks/features/home/domain/entities/rewards_entity.dart';
import 'package:tasks/features/home/infrastructure/rewards_repository.dart';


// Repository Provider
final rewardsRepositoryProvider = Provider<RewardsRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return RewardsRepository(apiService);
});

// Main Provider
final rewardsFutureProvider = FutureProvider<RewardsEntity>((ref) async {
  final repository = ref.read(rewardsRepositoryProvider);
  final result = await repository.getRewardsDetails();
  
  return result.fold(
    (error) => throw error,
    (rewards) => rewards,
  );
});