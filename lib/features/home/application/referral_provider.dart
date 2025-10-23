// lib/features/referral/application/referral_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/home/domain/entities/referral_entity.dart';
import 'package:tasks/features/home/infrastructure/referral_repository.dart';
import 'package:tasks/features/search/providers/search_providers.dart';


// Repository Provider
final referralRepositoryProvider = Provider<ReferralRepository>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return ReferralRepository(dioClient);
});

// Main Provider
final referralFutureProvider = FutureProvider<ReferralEntity>((ref) async {
  final repository = ref.read(referralRepositoryProvider);
  final result = await repository.getReferralDetails();
  
  return result.fold(
    (error) => throw error,
    (referral) => referral,
  );
});