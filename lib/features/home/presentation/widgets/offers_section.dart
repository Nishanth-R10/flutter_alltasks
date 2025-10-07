import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/home/infrastructure/offer_repository.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

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
    final offers = OfferRepository().getOffers();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Offers Heading
        Container(
          width: MediaQueryUtils.w(343),
          height: MediaQueryUtils.h(24), 
          child: Text(
            "Offers",
            style: GoogleFonts.dmSans(
              fontSize: MediaQueryUtils.sp(19),
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: 0,
              height: 1.0, 
            ),
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(0)), 
        SizedBox(
          height: MediaQueryUtils.h(100), 
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: offers.length,
            separatorBuilder: (_, __) => SizedBox(width: MediaQueryUtils.w(12)),
            itemBuilder: (context, index) {
              final item = offers[index];
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
                          Container(
                            width: MediaQueryUtils.w(80),
                            height: MediaQueryUtils.w(80),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFF4197CB),
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
                                item.iconAsset,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (item.discountText != null)
                            Positioned(
                              bottom: MediaQueryUtils.h(-3),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: MediaQueryUtils.w(8),
                                  vertical: MediaQueryUtils.h(3),
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFC321DC),
                                  borderRadius: BorderRadius.circular(
                                    MediaQueryUtils.r(12),
                                  ),
                                ),
                                child: Text(
                                  item.discountText!,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: MediaQueryUtils.sp(7.5),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(
                            height: MediaQueryUtils.h(15),
                          ), 
                          Container(
                            width: MediaQueryUtils.w(80),
                            height: MediaQueryUtils.h(0),
                            alignment: Alignment.center,
                            child: Text(
                              _formatTitle(item.title),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: MediaQueryUtils.sp(9.5),
                                fontWeight: FontWeight.w600,
                                height: 1.6,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
