// lib/features/home/presentation/pages/home_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/routes/app_route.gr.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/home/application/user_provider.dart';
import 'package:tasks/features/home/presentation/widgets/offer_section/offer_section.dart';
import 'package:tasks/features/home/presentation/widgets/quick_action/quick_action.dart';
import 'package:tasks/features/home/presentation/widgets/refer_earn/refer_earn_card.dart';
import 'package:tasks/features/home/presentation/widgets/rewards/rewards_section.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryUtils.init(context);
    
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQueryUtils.w(16), 
            vertical: MediaQueryUtils.h(18)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Type Toggle
              _buildUserTypeToggle(ref),
              SizedBox(height: MediaQueryUtils.h(20)),
              
              const QuickActions(),
              SizedBox(height: MediaQueryUtils.h(40)), 
              const RewardsSection(),
              SizedBox(height: MediaQueryUtils.h(40)), 
              const OffersSection(),
              SizedBox(height: MediaQueryUtils.h(40)),
              const ReferEarnCard(),
              
              // NAVIGATION SECTION
              SizedBox(height: MediaQueryUtils.h(40)),
              _buildNavigationSection(context),
              SizedBox(height: MediaQueryUtils.h(20)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserTypeToggle(WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(12)),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "User Type:",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: MediaQueryUtils.sp(14),
            ),
          ),
          Row(
            children: [
              Text(
                "New User",
                style: GoogleFonts.poppins(
                  fontSize: MediaQueryUtils.sp(12),
                  color: ref.watch(userTypeProvider) == UserType.newUser 
                      ? Colors.blue 
                      : Colors.grey,
                ),
              ),
              Switch(
                value: ref.watch(userTypeProvider) == UserType.returningUser,
                onChanged: (value) {
                  ref.read(userTypeProvider.notifier).state = 
                      value ? UserType.returningUser : UserType.newUser;
                },
              ),
              Text(
                "Returning User",
                style: GoogleFonts.poppins(
                  fontSize: MediaQueryUtils.sp(12),
                  color: ref.watch(userTypeProvider) == UserType.returningUser 
                      ? Colors.blue 
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

 Widget _buildNavigationSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: MediaQueryUtils.w(343),
        height: MediaQueryUtils.h(24),
        child: Text(
          "Navigate to Features",
          style: GoogleFonts.poppins(
            fontSize: MediaQueryUtils.sp(19),
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      SizedBox(height: MediaQueryUtils.h(12)),

      // Row for Search and Profile Buttons
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _navigationButton(
              context: context,
              title: "Search",
              icon: Icons.search,
              onTap: () => context.pushRoute(UnifiedSearchRoute()),
            ),
          ),
          SizedBox(width: MediaQueryUtils.w(12)),
          Expanded(
            child: _navigationButton(
              context: context,
              title: "Profile",
              icon: Icons.person,
              onTap: () => context.pushRoute(ProfileRoute()),
            ),
          ),
        ],
      ),
    ],
  );
}

  Widget _navigationButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(MediaQueryUtils.w(16)),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: MediaQueryUtils.r(6),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: MediaQueryUtils.sp(24), color: Colors.blue),
            SizedBox(height: MediaQueryUtils.h(8)),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: MediaQueryUtils.sp(14),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}