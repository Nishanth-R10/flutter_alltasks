<<<<<<< HEAD
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/offers/data/services/dfc_promotion_api_service.dart';

// Real API Service Provider
final dfcPromotionApiServiceProvider = Provider<DfcPromotionApiService>((ref) {
  return DfcPromotionApiService(
    baseUrl: 'https://your-api-base-url.com/api',
  );
});

// API Provider (for background updates)
final dfcCreditCardPromotionProvider = FutureProvider.autoDispose<Either<String, Map<String, dynamic>>>((ref) async {
  try {
    final apiService = ref.read(dfcPromotionApiServiceProvider);
    return await apiService.getDfcCreditCardPromotion();
  } catch (e) {
    return Left('API Error');
  }
});

// Provider to manage offer visibility state
final offerVisibilityProvider = StateProvider<Map<String, bool>>((ref) {
  return {};
});

// Provider to check if offer should be shown
final shouldShowOfferProvider = Provider.family<bool, String>((ref, offerId) {
  final visibilityMap = ref.watch(offerVisibilityProvider);
  return !(visibilityMap[offerId] ?? false);
});

// Loading state provider
final isOfferLoadingProvider = StateProvider<bool>((ref) => false);

// MAIN OFFER DATA PROVIDER - Returns data immediately
final creditCardOfferProvider = Provider<Map<String, dynamic>>((ref) {
  // Return fallback data immediately - no waiting for API
  return _getFallbackData();
});

// fallback data
Map<String, dynamic> _getFallbackData() {
  return {
    'id': 'dfc_credit_card_1',
    'title': 'Get your DFC Credit Card today!',
    'imagePath': 'assets/images/credit_card_offer.png',
    'description': 'You are now eligible\nfor an Instant Credit\ncard with maximum\nlimit upto 3,000.00\nQAR.',
    'primaryButtonText': 'Apply now',
    'secondaryButtonText': 'Close',
    'showDontShowAgain': true,
    'creditLimit': '3,000.00 QAR',
    'cardType': 'Instant Credit Card',
    'eligibility': 'Pre-approved',
  };
}
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// Provider to manage offer visibility state
final offerVisibilityProvider = StateProvider<Map<String, bool>>((ref) {
  return {};
});

// Provider to check if offer should be shown
final shouldShowOfferProvider = Provider.family<bool, String>((ref, offerId) {
  final visibilityMap = ref.watch(offerVisibilityProvider);
  return !(visibilityMap[offerId] ?? false);
});

// Provider for offer data
final creditCardOfferProvider = Provider<Map<String, dynamic>>((ref) {
  return {
    'id': 'credit_card_offer_1',
    'title': 'Get your DFC Credit Card today!',
    'imagePath': 'assets/images/credit_card_offer.png',
    'description': 'You are now eligible\nfor an Instant Credit\ncard with maximum\nlimit upto 3,000.00\nQAR.',
    'primaryButtonText': 'Apply now',
    'secondaryButtonText': 'Close',
    'showDontShowAgain': true,
  };
});
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
