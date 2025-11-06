// lib/features/offers/providers/custom_offer_dialog_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final customOfferDialogProvider = StateNotifierProvider<CustomOfferDialogNotifier, CustomOfferDialogState>((ref) {
  return CustomOfferDialogNotifier();
});

class CustomOfferDialogState {
  final bool dontShowAgain;
  final String? currentOfferId;

  CustomOfferDialogState({
    this.dontShowAgain = false,
    this.currentOfferId,
  });

  CustomOfferDialogState copyWith({
    bool? dontShowAgain,
    String? currentOfferId,
  }) {
    return CustomOfferDialogState(
      dontShowAgain: dontShowAgain ?? this.dontShowAgain,
      currentOfferId: currentOfferId ?? this.currentOfferId,
    );
  }
}

class CustomOfferDialogNotifier extends StateNotifier<CustomOfferDialogState> {
  CustomOfferDialogNotifier() : super(CustomOfferDialogState());

  void setDontShowAgain(bool value, String offerId) {
    state = state.copyWith(
      dontShowAgain: value,
      currentOfferId: offerId,
    );
  }

  void reset() {
    state = CustomOfferDialogState();
  }
}