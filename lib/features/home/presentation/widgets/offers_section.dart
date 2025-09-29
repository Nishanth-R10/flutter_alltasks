// lib/features/dashboard/presentation/widgets/offers_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final offers = OfferRepository().getOffers();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Offers',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 19.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 160.h, // Use height instead of width for better responsiveness
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: offers.length,
            separatorBuilder: (_, __) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final item = offers[index];
              return Container(
                width: 90.w, 
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    Container(
                      height: 100.h,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomCenter,
                        children: [
                          // Circular Image Container
                          Container(
                            width: 80.w,
                            height: 80.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blue,
                                width: 1.5.w,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 8.r,
                                  offset: Offset(0, 2.h),
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
                          
                          // Discount Badge
                          if (item.discountText != null)
                            Positioned(
                              bottom: -5.h,
                              child: Container(
                                constraints: BoxConstraints(
                                  minWidth: 40.w,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.purpleAccent,
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4.r,
                                      offset: Offset(0, 1.h),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  item.discountText!,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 9.sp, // Slightly larger font
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
                    
                    // Title Text
                    SizedBox(height: 8.h),
                    Container(
                      width: 80.w,
                      child: Text(
                        _formatTitle(item.title),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 11.sp, // Slightly larger for readability
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
        SizedBox(height: 16.h),
      ],
    );
  }
}