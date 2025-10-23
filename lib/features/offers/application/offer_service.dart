<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/offers/application/offer_provider.dart';
import 'package:tasks/features/offers/widgets/custom_offer_dialog.dart';
import 'package:tasks/features/offers/widgets/offer_shimmer.dart';

class OfferService {
  static void showCreditCardOffer(BuildContext context, WidgetRef ref) {
    // Set loading state
    ref.read(isOfferLoadingProvider.notifier).state = true;
    
    
    final offerData = ref.read(creditCardOfferProvider);
    final shouldShow = ref.read(shouldShowOfferProvider(offerData['id']));
    
    if (!shouldShow) {
      if (kDebugMode) debugPrint('Offer ${offerData['id']} is hidden by user');
      ref.read(isOfferLoadingProvider.notifier).state = false;
      return;
    }

    if (kDebugMode) debugPrint('Showing DFC credit card offer with shimmer effect');
    
    // Show shimmer dialog first
    _showShimmerDialog(context, ref, offerData);
  }

  static void _showShimmerDialog(BuildContext context, WidgetRef ref, Map<String, dynamic> offerData) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing shimmer 
      builder: (context) => OfferShimmer(baseSize: 4.0),
    ).then((_) {
      //runs when dialog is closed
      ref.read(isOfferLoadingProvider.notifier).state = false;
    });
    
    // Simulate API delay and then show actual offer
    Future.delayed(Duration(seconds: 2), () {
      if (context.mounted) {
        Navigator.of(context).pop(); 
        _showActualOfferDialog(context, ref, offerData);
      }
    });
  }

  static void _showActualOfferDialog(BuildContext context, WidgetRef ref, Map<String, dynamic> offerData) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allow closing the actual offer
      builder: (context) => CustomOfferDialog(
        offerId: offerData['id'],
        title: offerData['title'],
        imagePath: offerData['imagePath'],
        description: offerData['description'],
        primaryButtonText: offerData['primaryButtonText'],
        secondaryButtonText: offerData['secondaryButtonText'],
        showDontShowAgain: offerData['showDontShowAgain'],
        onPrimaryButtonPressed: () {
          _handleCreditCardApplication(context, ref, offerData);
        },
        onSecondaryButtonPressed: () {
          Navigator.of(context).pop(); // Close offer dialog and return to home
        },
      ),
    ).then((_) {
      // When actual offer is closed, ensure loading state is reset
      ref.read(isOfferLoadingProvider.notifier).state = false;
    });
  }

  static void showCreditCardOfferInstantly(BuildContext context, WidgetRef ref) {
    // Bypass shimmer for instant show
    final offerData = ref.read(creditCardOfferProvider);
    final shouldShow = ref.read(shouldShowOfferProvider(offerData['id']));
    
    if (!shouldShow) {
      if (kDebugMode) debugPrint(' Offer ${offerData['id']} is hidden by user');
      return;
    }

    _showActualOfferDialog(context, ref, offerData);
  }

  static void _handleCreditCardApplication(BuildContext context, WidgetRef ref, Map<String, dynamic> offerData) {
    Navigator.of(context).pop(); 
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Starting ${offerData['cardType']} application!'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
    
  if (kDebugMode) debugPrint(' Application started for: ${offerData['id']}');
    
    // Here you can navigate to application screen if needed
    // context.pushRoute(const CreditCardApplicationRoute());
  }

  static void resetOfferVisibility(WidgetRef ref, String offerId) {
    ref.read(offerVisibilityProvider.notifier).state = {
      ...ref.read(offerVisibilityProvider),
      offerId: false,
    };
  if (kDebugMode) debugPrint(' Offer visibility reset for: $offerId');
  }

  // Method to close any open dialogs and return to home
  static void closeAllDialogs(BuildContext context, WidgetRef ref) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    ref.read(isOfferLoadingProvider.notifier).state = false;
  }
=======
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
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}