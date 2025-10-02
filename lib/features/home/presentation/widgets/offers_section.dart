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
        Text(
          'Offers',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: MediaQueryUtils.sp(19),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(12)),
        SizedBox(
          height: MediaQueryUtils.w(140),
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
                      height: MediaQueryUtils.h(90),
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
                                  color: Colors.purpleAccent,
                                  borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
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

                          SizedBox(height: MediaQueryUtils.h(20)),

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