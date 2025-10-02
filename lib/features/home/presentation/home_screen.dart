import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/routes/app_route.gr.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/home/presentation/widgets/offers_section.dart';
import 'package:tasks/features/home/presentation/widgets/quick_actions.dart';
import 'package:tasks/features/home/presentation/widgets/refer_earn_card.dart';
import 'package:tasks/features/home/presentation/widgets/rewards_section.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              const QuickActions(),
              SizedBox(height: MediaQueryUtils.h(24)),
              const RewardsSection(),
              SizedBox(height: MediaQueryUtils.h(24)),
              const OffersSection(),
              SizedBox(height: MediaQueryUtils.h(24)),
              
              Text('Refer & Earn',
                  style: GoogleFonts.poppins(
                    fontSize: MediaQueryUtils.sp(19),
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  )),
              SizedBox(height: MediaQueryUtils.h(12)),
              const ReferEarnCard(),
              
              // NAVIGATION SECTION
              SizedBox(height: MediaQueryUtils.h(30)),
              _buildNavigationSection(context),
              SizedBox(height: MediaQueryUtils.h(20)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Navigate to Features",
          style: GoogleFonts.poppins(
            fontSize: MediaQueryUtils.sp(19),
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(12)),
        
        // First row with Profile and Financial Services buttons
        Row(
          children: [
            Expanded(
              child: _navigationButton(
                context: context,
                title: "Profile",
                icon: Icons.person,
                onTap: () => context.pushRoute(const ProfileRoute()),
              ),
            ),
            SizedBox(width: MediaQueryUtils.w(12)),
            Expanded(
              child: _navigationButton(
                context: context,
                title: "Financial Services",
                icon: Icons.account_balance,
                onTap: () => context.pushRoute( FinancialServicesRoute()),
              ),
            ),
          ],
        ),
        
        SizedBox(height: MediaQueryUtils.h(12)),
        
        // Second row with New User and Returning User buttons
        Row(
          children: [
            Expanded(
              child: _navigationButton(
                context: context,
                title: "New User Search",
                icon: Icons.person_add,
                onTap: () => context.pushRoute( NewUserSearchRoute()),
              ),
            ),
            SizedBox(width: MediaQueryUtils.w(12)),
            Expanded(
              child: _navigationButton(
                context: context,
                title: "Returning User",
                icon: Icons.person_outline,
                onTap: () => context.pushRoute( ReturningUserSearchRoute()),
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