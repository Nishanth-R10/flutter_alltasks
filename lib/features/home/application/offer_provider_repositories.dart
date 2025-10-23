// lib/features/home/application/offer_provider_repositories.dart
part of 'offer_provider.dart';

//Repository Providers
final flightOfferRepositoryProvider = Provider<FlightOfferRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return FlightOfferRepository(apiService);
});

final goldOfferRepositoryProvider = Provider<GoldOfferRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return GoldOfferRepository(apiService);
});

final tourOfferRepositoryProvider = Provider<TourOfferRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return TourOfferRepository(apiService);
});

final investmentOfferRepositoryProvider = Provider<InvestmentOfferRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return InvestmentOfferRepository(apiService);
});