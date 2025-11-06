import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tasks/features/home/data/datasource/home_local_data_source.dart';
import 'package:tasks/features/home/data/repositories/offer_repository_impl.dart';
import 'package:tasks/features/home/data/repositories/referral_repository_impl.dart';
import 'package:tasks/features/home/data/repositories/rewards_repository_impl.dart';
import 'package:tasks/features/home/domain/entities/offer_entity.dart';
import 'package:tasks/features/home/domain/entities/referral_entity.dart';
import 'package:tasks/features/home/domain/entities/rewards_entity.dart';

// Local Data Source Provider
final homeLocalDataSourceProvider = Provider<HomeLocalDataSource>((ref) {
  return HomeLocalDataSource();
});

// Repository Providers
final offerRepositoryProvider = Provider<OfferRepositoryImpl>((ref) {
  final localDataSource = ref.read(homeLocalDataSourceProvider);
  return OfferRepositoryImpl(localDataSource);
});

final referralRepositoryProvider = Provider<ReferralRepositoryImpl>((ref) {
  final localDataSource = ref.read(homeLocalDataSourceProvider);
  return ReferralRepositoryImpl(localDataSource);
});

final rewardsRepositoryProvider = Provider<RewardsRepositoryImpl>((ref) {
  final localDataSource = ref.read(homeLocalDataSourceProvider);
  return RewardsRepositoryImpl(localDataSource);
});

// Data Providers
final offersFutureProvider = FutureProvider<List<OfferEntity>>((ref) async {
  final repository = ref.read(offerRepositoryProvider);
  final result = await repository.getOffers();
  return result.fold((error) => throw error, (offers) => offers);
});

final referralFutureProvider = FutureProvider<ReferralEntity>((ref) async {
  final repository = ref.read(referralRepositoryProvider);
  final result = await repository.getReferralDetails();
  return result.fold((error) => throw error, (referral) => referral);
});

final rewardsFutureProvider = FutureProvider<RewardsEntity>((ref) async {
  final repository = ref.read(rewardsRepositoryProvider);
  final result = await repository.getRewardsDetails();
  return result.fold((error) => throw error, (rewards) => rewards);
});

// UI State Providers
final selectedOfferTabProvider = StateProvider<int>((ref) => 0);