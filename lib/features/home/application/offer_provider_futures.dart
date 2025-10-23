// lib/features/home/application/offer_provider_futures.dart
part of 'offer_provider.dart';

// Separate Offer Providers
final flightOffersFutureProvider = FutureProvider<List<FlightOfferEntity>>((ref) async {
  final repository = ref.read(flightOfferRepositoryProvider);
  final result = await repository.getFlightOffers();
  return result.fold((error) => throw error, (offers) => offers);
});

final goldOffersFutureProvider = FutureProvider<List<GoldOfferEntity>>((ref) async {
  final repository = ref.read(goldOfferRepositoryProvider);
  final result = await repository.getGoldOffers();
  return result.fold((error) => throw error, (offers) => offers);
});

final tourOffersFutureProvider = FutureProvider<List<TourOfferEntity>>((ref) async {
  final repository = ref.read(tourOfferRepositoryProvider);
  final result = await repository.getTourOffers();
  return result.fold((error) => throw error, (offers) => offers);
});

final investmentOffersFutureProvider = FutureProvider<List<InvestmentOfferEntity>>((ref) async {
  final repository = ref.read(investmentOfferRepositoryProvider);
  final result = await repository.getInvestmentOffers();
  return result.fold((error) => throw error, (offers) => offers);
});

final offersFutureProvider = FutureProvider<List<OfferEntity>>((ref) async {
  print('Combined Offers Provider: Fetching from separate APIs...');
  
  // Call all separate APIs
  final flightAsync = ref.read(flightOffersFutureProvider.future);
  final goldAsync = ref.read(goldOffersFutureProvider.future);
  final tourAsync = ref.read(tourOffersFutureProvider.future);
  final investmentAsync = ref.read(investmentOffersFutureProvider.future);

  //  for all APIs 
  final results = await Future.wait([flightAsync, goldAsync, tourAsync, investmentAsync]);
  
  // Combine all offers into one list (maintaining your exact order)
  final allOffers = <OfferEntity>[];
  
  for (final result in results) {
    for (final entity in result) {
      // Each result item may be a different home-specific entity.
      if (entity is FlightOfferEntity) {
        allOffers.add(OfferEntity(
          id: entity.id,
          title: entity.title,
          description: entity.description,
          imageUrl: entity.imageUrl,
          primaryButtonText: '',
          secondaryButtonText: '',
          showDontShowAgain: false,
          creditLimit: '',
          cardType: '',
          eligibility: '',
          validUntil: null,
        ));
      } else if (entity is GoldOfferEntity) {
        allOffers.add(OfferEntity(
          id: entity.id,
          title: entity.title,
          description: entity.description,
          imageUrl: entity.imageUrl,
          primaryButtonText: '',
          secondaryButtonText: '',
          showDontShowAgain: false,
          creditLimit: '',
          cardType: '',
          eligibility: '',
          validUntil: null,
        ));
      } else if (entity is TourOfferEntity) {
        allOffers.add(OfferEntity(
          id: entity.id,
          title: entity.title,
          description: entity.description,
          imageUrl: entity.imageUrl,
          primaryButtonText: '',
          secondaryButtonText: '',
          showDontShowAgain: false,
          creditLimit: '',
          cardType: '',
          eligibility: '',
          validUntil: null,
        ));
      } else if (entity is InvestmentOfferEntity) {
        allOffers.add(OfferEntity(
          id: entity.id,
          title: entity.title,
          description: entity.description,
          imageUrl: entity.imageUrl,
          primaryButtonText: '',
          secondaryButtonText: '',
          showDontShowAgain: false,
          creditLimit: '',
          cardType: '',
          eligibility: '',
          validUntil: null,
        ));
      } else {
        // Fallback 
        try {
          final id = (entity as dynamic).id as String? ?? '';
          final title = (entity as dynamic).title as String? ?? '';
          final description = (entity as dynamic).description as String? ?? '';
          final imageUrl = (entity as dynamic).imageUrl as String? ?? '';
          allOffers.add(OfferEntity(
            id: id,
            title: title,
            description: description,
            imageUrl: imageUrl,
            primaryButtonText: '',
            secondaryButtonText: '',
            showDontShowAgain: false,
            creditLimit: '',
            cardType: '',
            eligibility: '',
            validUntil: null,
          ));
        } catch (_) {
          
        }
      }
    }
  }
  
  print('✅ Combined Offers Success: ${allOffers.length} offers from 4 separate APIs');
  return allOffers;
});