
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_color.dart';

class RewardsSection extends StatelessWidget {
  const RewardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rewards",
          style: GoogleFonts.poppins(
            fontSize: 19.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color:Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 6.r,
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(Icons.card_giftcard,
                  size: 20.sp, color: const Color.fromARGB(255, 76, 171, 248)),
              SizedBox(width: 15.w),
              Text(
                '1285 Reward Points earned',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Icon(Icons.north_east,
                  size: 16.sp, color: const Color.fromARGB(255, 76, 171, 248)),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7E6),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 150 text on top
                      Text(
                        '150',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                      // + and coin image below
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 1.w),
                          
                          Image.asset(
                            'assets/images/coin.png', 
                            width: 14.w,
                            height: 14.w,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Claim upto 150 reward points after reaching the next transaction goal.',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFEFEF),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                              FractionallySizedBox(
                                widthFactor: 0.65,
                                child: Container(
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 117, 155, 252),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'QAR 240 away',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 11.sp,
                            color: const Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}