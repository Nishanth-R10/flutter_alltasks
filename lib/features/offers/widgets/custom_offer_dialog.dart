<<<<<<< HEAD
// lib/features/offers/widgets/custom_offer_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/offers/application/offer_provider.dart';
import 'package:tasks/features/offers/application/offer_service.dart';

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
    return Container(
      width: double.infinity,
      decoration: _buildDialogDecoration(),
      child: Padding(
        padding: EdgeInsets.all(MediaQueryUtils.w(24)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(),
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

  BoxDecoration _buildDialogDecoration() {
    return BoxDecoration(
      color: Colors.white,
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
=======
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/offers/application/offer_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: MediaQueryUtils.w(24)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(MediaQueryUtils.r(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: MediaQueryUtils.r(20),
              offset: Offset(0, MediaQueryUtils.h(10)),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(MediaQueryUtils.w(24)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQueryUtils.w(4),
                  right: MediaQueryUtils.w(4),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.title,
                    style: GoogleFonts.poppins(
                      fontSize: MediaQueryUtils.sp(18),
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF003D82),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              ),
              SizedBox(height: MediaQueryUtils.h(20)),

              // Image and Description Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Stack (with your credit card images)
                  SizedBox(
                    width: MediaQueryUtils.w(100),
                    height: MediaQueryUtils.h(80),
                    child: Stack(
                      children: [
                        // Red card - Background positioned like "7"
                        Positioned(
                          right: MediaQueryUtils.w(0),
                          top: MediaQueryUtils.h(0),
                          child: Transform.rotate(
                            angle: -0.1, // More rotation for "7" shape
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(MediaQueryUtils.r(8)),
                              child: Image.asset(
                                'assets/images/credit.png',
                                width: MediaQueryUtils.w(75),
                                height: MediaQueryUtils.h(50),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        // Blue card (Visa) - Centered in foreground
                        Positioned(
                          left: MediaQueryUtils.w(15),
                          top: MediaQueryUtils.h(15),
                          child: Transform.rotate(
                            angle: 0, // Very slight rotation
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(MediaQueryUtils.r(8)),
                              child: Image.asset(
                                'assets/images/visa.png',
                                width: MediaQueryUtils.w(75),
                                height: MediaQueryUtils.h(50),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: MediaQueryUtils.w(16)),

                  // Description
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: MediaQueryUtils.h(8)),
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: MediaQueryUtils.sp(14),
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            height: 1.5,
                          ),
                          children: _parseDescription(widget.description),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQueryUtils.h(24)),

              // "Don't Show this offer again" Checkbox
              if (widget.showDontShowAgain) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQueryUtils.w(20),
                      height: MediaQueryUtils.h(20),
                      child: Checkbox(
                        value: _dontShowAgain,
                        onChanged: (value) {
                          setState(() {
                            _dontShowAgain = value ?? false;
                          });
                          if (_dontShowAgain) {
                            ref.read(offerVisibilityProvider.notifier).state = {
                              ...ref.read(offerVisibilityProvider),
                              widget.offerId: true,
                            };
                          } else {
                            ref.read(offerVisibilityProvider.notifier).state = {
                              ...ref.read(offerVisibilityProvider),
                              widget.offerId: false,
                            };
                          }
                        },
                        activeColor: const Color(0xFF003D82),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(MediaQueryUtils.r(4)),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQueryUtils.w(8)),
                    Flexible(
                      child: Text(
                        "Dont Show this offer again!",
                        style: GoogleFonts.poppins(
                          fontSize: MediaQueryUtils.sp(12),
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQueryUtils.h(20)),
              ],

              // Primary Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onPrimaryButtonPressed();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003D82),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQueryUtils.h(14),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(MediaQueryUtils.r(25)),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.primaryButtonText,
                        style: GoogleFonts.poppins(
                          fontSize: MediaQueryUtils.sp(16),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: MediaQueryUtils.w(8)),
                      Icon(
                        Icons.north_east,
                        size: MediaQueryUtils.sp(18),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQueryUtils.h(12)),

              // Secondary Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    widget.onSecondaryButtonPressed();
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQueryUtils.h(14),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(MediaQueryUtils.r(25)),
                    ),
                    side: const BorderSide(
                      color: Color(0xFF003D82),
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    widget.secondaryButtonText,
                    style: GoogleFonts.poppins(
                      fontSize: MediaQueryUtils.sp(16),
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF003D82),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<TextSpan> _parseDescription(String description) {
    final words = description.split(' ');
    List<TextSpan> spans = [];

    for (int i = 0; i < words.length; i++) {
      String word = words[i];

      // Bold numbers and keywords
      bool isBold = word.contains(RegExp(r'\d')) ||
          word.toLowerCase().contains('maximum') ||
          word.toLowerCase().contains('limit') ||
          word.toLowerCase().contains('upto');

      spans.add(
        TextSpan(
          text: word + (i < words.length - 1 ? ' ' : ''),
          style: GoogleFonts.poppins(
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      );
    }

    return spans;
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}