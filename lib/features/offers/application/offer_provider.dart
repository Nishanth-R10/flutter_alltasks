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