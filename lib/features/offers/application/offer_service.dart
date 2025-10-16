import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/offers/application/offer_provider.dart';
import 'package:tasks/features/offers/widgets/custom_offer_dialog.dart' hide creditCardOfferProvider, shouldShowOfferProvider;

class OfferService {
  static void showCreditCardOffer(BuildContext context, WidgetRef ref) {
    final offerData = ref.read(creditCardOfferProvider);
    final shouldShow = ref.read(shouldShowOfferProvider(offerData['id']));
    
    if (!shouldShow) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomOfferDialog(
        offerId: offerData['id'],
        title: offerData['title'],
        imagePath: offerData['imagePath'],
        description: offerData['description'],
        primaryButtonText: offerData['primaryButtonText'],
        secondaryButtonText: offerData['secondaryButtonText'],
        showDontShowAgain: offerData['showDontShowAgain'],
        onPrimaryButtonPressed: () {
          _handleCreditCardApplication(context, ref);
        },
        onSecondaryButtonPressed: () {
          // Just close the dialog, no additional action
        },
      ),
    );
  }

  static void _handleCreditCardApplication(BuildContext context, WidgetRef ref) {
    // Handle credit card application logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Credit card application started!'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
    
    // You can add navigation to application screen here
    // context.pushRoute(const CreditCardApplicationRoute());
  }

  // Method to reset offer visibility (useful for testing)
  static void resetOfferVisibility(WidgetRef ref, String offerId) {
    ref.read(offerVisibilityProvider.notifier).state = {
      ...ref.read(offerVisibilityProvider),
      offerId: false,
    };
  }
}