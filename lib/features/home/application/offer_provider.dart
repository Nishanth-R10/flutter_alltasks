// lib/features/home/application/offer_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/home/domain/entities/offer_entity.dart';
import 'package:tasks/features/home/infrastructure/offer_repository.dart';

// Offer Repository Provider
final offerRepositoryProvider = Provider<OfferRepository>((ref) {
  return OfferRepository();
});

// Offers Provider - Returns hardcoded offers immediately
final offersProvider = Provider<List<OfferEntity>>((ref) {
  final repository = ref.read(offerRepositoryProvider);
  final offers = repository.getOffers();
  
  print('✅ Offers Provider: Loaded ${offers.length} hardcoded offers');
  return offers;
});