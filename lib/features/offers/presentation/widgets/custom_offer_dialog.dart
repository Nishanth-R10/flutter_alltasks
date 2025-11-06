// lib/features/offers/widgets/custom_offer_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/offers/application/offer_provider.dart';
import 'package:tasks/features/offers/application/offer_service.dart';
import 'package:tasks/features/offers/presentation/conroller/custom_offer_dialog_provider.dart';

part 'custom_offer_dialog_part2.dart';
part 'custom_offer_dialog_part3.dart';

class CustomOfferDialog extends ConsumerStatefulWidget {
  final String offerId;
  final String title;
  final String imagePath;
  final String description;
  final String primaryButtonText;
  final String secondaryButtonText;
  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback onSecondaryButtonPressed;
  final bool showDontShowAgain;

  const CustomOfferDialog({
    super.key,
    required this.offerId,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.onPrimaryButtonPressed,
    required this.onSecondaryButtonPressed,
    this.showDontShowAgain = true,
  });

  @override
  ConsumerState<CustomOfferDialog> createState() => _CustomOfferDialogState();
}

class _CustomOfferDialogState extends ConsumerState<CustomOfferDialog> {
  bool _dontShowAgain = false;

  // ignore: unused_element
  static Future<void> showDfcCreditCardPromotion(BuildContext context, WidgetRef ref) async {
    final apiResult = ref.read(dfcCreditCardPromotionProvider);
    
    await apiResult.when(
      loading: () async {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Loading your special offer...'),
              ],
            ),
          ),
        );
      },
      error: (error, stack) async {
        print('API Error: $error');
        OfferService.showCreditCardOffer(context, ref);
      },
      data: (result) async {
        result.fold(
          (error) {
            print('API Error: $error');
            OfferService.showCreditCardOffer(context, ref);
          },
          (apiData) {
            OfferService.showCreditCardOffer(context, ref);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: MediaQueryUtils.w(24)),
      child: _buildDialogContent(),
    );
  }

  Widget _buildDialogContent() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Container(
      width: double.infinity,
      decoration: _buildDialogDecoration(isDark),
      child: Padding(
        padding: EdgeInsets.all(MediaQueryUtils.w(24)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(isDark),
            SizedBox(height: MediaQueryUtils.h(20)),
            _buildContentRow(),
            SizedBox(height: MediaQueryUtils.h(24)),
            if (widget.showDontShowAgain) ..._buildDontShowAgainSection(),
            _buildPrimaryButton(),
            SizedBox(height: MediaQueryUtils.h(12)),
            _buildSecondaryButton(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDialogDecoration(bool isDark) {
    return BoxDecoration(
      color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      borderRadius: BorderRadius.circular(MediaQueryUtils.r(16)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: MediaQueryUtils.r(20),
          offset: Offset(0, MediaQueryUtils.h(10)),
        ),
      ],
    );
  }
}