// lib/features/dashboard/presentation/widgets/refer_earn_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ReferEarnCard extends StatelessWidget {
  const ReferEarnCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, 
      children: [
        Container(
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            color:Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8.r),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invite friends and earn 50 points\nfor each successful referral!',
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Referral Code',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Text(
                            'F R I E N D 2 0 2 4',
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Icon(
                            Icons.copy,
                            size: 18.sp,
                            color: const Color.fromARGB(255, 76, 171, 248),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text('Share Link', style: GoogleFonts.poppins(color: const Color.fromARGB(255, 76, 171, 248),)),
                        SizedBox(width: 4.w),
                        const Icon(Icons.share,color:  Color.fromARGB(255, 76, 171, 248),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

       
        Positioned(
          top: -20.h,  
          right: 30.w, 
          child: Image.asset(
            'assets/images/gift.png',
            width: 80.w,
            height: 80.w,
          ),
        ),
      ],
    );
  }
}
