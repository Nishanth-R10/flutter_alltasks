// lib/features/home/presentation/widgets/offers_section.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/home/infrastructure/offer_repository.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  // Helper method to force two lines for short texts
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQueryUtils.w(16)),
          child: Text(
            'Offers',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: MediaQueryUtils.sp(19),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(12)),
        SizedBox(
          height: MediaQueryUtils.h(160),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: MediaQueryUtils.w(16)),
            itemCount: offers.length,
            separatorBuilder: (_, __) => SizedBox(width: MediaQueryUtils.w(16)),
            itemBuilder: (context, index) {
              final item = offers[index];
              return Container(
                width: MediaQueryUtils.w(90), 
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: MediaQueryUtils.h(100),
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
                                color: Colors.blue,
                                width: MediaQueryUtils.w(1.5),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: MediaQueryUtils.r(8),
                                  offset: Offset(0, MediaQueryUtils.h(2)),
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
                              bottom: MediaQueryUtils.h(-5),
                              child: Container(
                                constraints: BoxConstraints(
                                  minWidth: MediaQueryUtils.w(40),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: MediaQueryUtils.w(6),
                                  vertical: MediaQueryUtils.h(2),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.purpleAccent,
                                  borderRadius: BorderRadius.circular(MediaQueryUtils.r(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: MediaQueryUtils.r(4),
                                      offset: Offset(0, MediaQueryUtils.h(1)),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  item.discountText!,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: MediaQueryUtils.sp(9),
                                    fontWeight: FontWeight.w600,
                                    height: 1.2,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQueryUtils.h(8)),
                    Container(
                      width: MediaQueryUtils.w(80),
                      child: Text(
                        _formatTitle(item.title),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: MediaQueryUtils.sp(11),
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(16)),
      ],
    );
  }
}