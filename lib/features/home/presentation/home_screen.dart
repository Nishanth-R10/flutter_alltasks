
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/home/presentation/widgets/offers_section.dart';
import 'package:tasks/features/home/presentation/widgets/quick_actions.dart';
import 'package:tasks/features/home/presentation/widgets/refer_earn_card.dart';
import 'package:tasks/features/home/presentation/widgets/rewards_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const QuickActions(),
              SizedBox(height: 24.h),
              const RewardsSection(),
              SizedBox(height: 24.h), 
              const OffersSection(),
              SizedBox(height: 24.h), 
              
              Text('Refer & Earn',
                  style: GoogleFonts.poppins(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  )),
              SizedBox(height: 12.h), 
              const ReferEarnCard(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}