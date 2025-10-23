// lib/features/offers/widgets/custom_offer_dialog_part2.dart
part of 'custom_offer_dialog.dart';

extension CustomOfferDialogUI on _CustomOfferDialogState {
  Widget _buildTitle() {
    return Padding(
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
    );
  }

  Widget _buildContentRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageStack(),
        SizedBox(width: MediaQueryUtils.w(16)),
        _buildDescription(),
      ],
    );
  }

  Widget _buildImageStack() {
    return SizedBox(
      width: MediaQueryUtils.w(100),
      height: MediaQueryUtils.h(90),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background rotated card 
          Positioned(
            right: MediaQueryUtils.w(0), 
            top: MediaQueryUtils.h(25), 
            child: Transform.rotate(
              angle: -0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(MediaQueryUtils.r(10)),
                child: Image.asset(
                  'assets/images/credit.png',
                  width: MediaQueryUtils.w(90),
                  height: MediaQueryUtils.h(55),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          
          Positioned(
            left: MediaQueryUtils.w(5), 
            top: MediaQueryUtils.h(40),
            child: Transform.rotate(
              angle: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(MediaQueryUtils.r(10)),
                child: Image.asset(
                  'assets/images/visa.png',
                  width: MediaQueryUtils.w(90),
                  height: MediaQueryUtils.h(50),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Expanded(
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
    );
  }
}