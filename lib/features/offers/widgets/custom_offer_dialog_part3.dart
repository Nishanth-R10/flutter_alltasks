// lib/features/offers/widgets/custom_offer_dialog_part3.dart
part of 'custom_offer_dialog.dart';

extension CustomOfferDialogButtons on _CustomOfferDialogState {
  List<Widget> _buildDontShowAgainSection() {
    return [
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
                borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
              ),
            ),
          ),
          SizedBox(width: MediaQueryUtils.w(8)),
          Flexible(
            child: Text(
              "Don't Show this offer again!",
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
    ];
  }

  Widget _buildPrimaryButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          widget.onPrimaryButtonPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF003D82),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: MediaQueryUtils.h(14)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(25)),
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
            Icon(Icons.north_east, size: MediaQueryUtils.sp(18)),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondaryButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          widget.onSecondaryButtonPressed();
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: MediaQueryUtils.h(14)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(25)),
          ),
          side: const BorderSide(color: Color(0xFF003D82), width: 1.5),
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
    );
  }

  List<TextSpan> _parseDescription(String description) {
    final words = description.split(' ');
    List<TextSpan> spans = [];

    for (int i = 0; i < words.length; i++) {
      String word = words[i];
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
}