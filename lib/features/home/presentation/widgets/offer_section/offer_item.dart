import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/home/domain/offer_entity.dart';

class OfferItem extends StatelessWidget {
  final OfferEntity offer;

  const OfferItem({super.key, required this.offer});

  String _formatTitle(String title) {
    switch (title) {
      case "Invest in Gold":
        return "Invest\nin Gold";
      case "Invest & Earn":
        return "Invest\n& Earn";
      case "Tours & Attractions":
        return "Tours &\nAttractions";
      case "Offers on Flight Booking":
        return "Offers on\nFlight Booking";
      default:
        return title;
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Container(
      width: MediaQueryUtils.w(80),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: MediaQueryUtils.h(75),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                _buildOfferCircle(),
                if (offer.discountText != null) _buildDiscountBadge(),
                SizedBox(height: MediaQueryUtils.h(15)),
                _buildOfferTitle(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfferCircle() {
    return Container(
      width: MediaQueryUtils.w(80),
      height: MediaQueryUtils.w(80),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF4197CB),
          width: MediaQueryUtils.w(2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: MediaQueryUtils.r(6),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          offer.iconAsset,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDiscountBadge() {
    return Positioned(
      bottom: MediaQueryUtils.h(-3),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQueryUtils.w(8),
          vertical: MediaQueryUtils.h(3),
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFC321DC),
          borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
        ),
        child: Text(
          offer.discountText!,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: MediaQueryUtils.sp(7.5),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildOfferTitle() {
    return Container(
      width: MediaQueryUtils.w(80),
      height: MediaQueryUtils.h(0),
      alignment: Alignment.center,
      child: Text(
        _formatTitle(offer.title),
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: MediaQueryUtils.sp(9.5),
          fontWeight: FontWeight.w600,
          height: 1.6,
        ),
        maxLines: 2,
        overflow: TextOverflow.visible,
      ),
    );
  }
}