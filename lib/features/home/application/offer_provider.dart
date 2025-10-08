// lib/features/home/application/offer_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/offer_entity.dart';
import '../infrastructure/offer_repository.dart';

final offerProvider = Provider<List<OfferEntity>>((ref) {
  return OfferRepository().getOffers();
});