// lib/features/rewards/application/rewards_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/home/domain/entities/rewards_entity.dart';
import 'package:tasks/features/home/infrastructure/rewards_repository.dart';
import 'package:tasks/features/search/providers/search_providers.dart';


// Repository Provider
final rewardsRepositoryProvider = Provider<RewardsRepository>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return RewardsRepository(dioClient);
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