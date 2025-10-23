import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/routes/app_route.gr.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/home/application/offer_provider.dart';
import 'package:tasks/features/home/application/user_provider.dart';
import 'package:tasks/features/home/domain/entities/offer_entity.dart';
import 'package:tasks/features/home/presentation/widgets/offer_section/offer_section.dart';
import 'package:tasks/features/home/presentation/widgets/quick_action/quick_action.dart';
import 'package:tasks/features/home/presentation/widgets/refer_earn/refer_earn_card.dart';
import 'package:tasks/features/home/presentation/widgets/rewards/rewards_section.dart';
import 'package:tasks/features/profile/presentation/controller/app_providers.dart';
// Add these imports
import 'package:tasks/features/offers/application/offer_service.dart';
import 'package:tasks/features/offers/application/offer_provider.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Show credit card offer when home screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      OfferService.showCreditCardOffer(context, ref);
    });
  }

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
              // User Type Toggle
              _buildUserTypeToggle(ref),
              SizedBox(height: MediaQueryUtils.h(20)),
              
              // API Test Section
              _buildApiTestSection(context, ref),
              SizedBox(height: MediaQueryUtils.h(20)),
              
              // Credit Card Offer Test Button
              _buildCreditCardOfferTestSection(context, ref),
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

  // NEW: Credit Card Offer Test Section
  Widget _buildCreditCardOfferTestSection(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(16)),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
        border: Border.all(color: Colors.orange),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.credit_card, color: Colors.orange),
              SizedBox(width: MediaQueryUtils.w(8)),
              Text(
                "CREDIT CARD OFFER TEST",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.orange[700],
                  fontSize: MediaQueryUtils.sp(14),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQueryUtils.h(12)),
          Text(
            "Test the credit card offer dialog functionality",
            style: GoogleFonts.poppins(
              fontSize: MediaQueryUtils.sp(12),
              color: Colors.orange[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQueryUtils.h(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => OfferService.showCreditCardOffer(context, ref),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: Text('Show Offer'),
              ),
              OutlinedButton(
                onPressed: () {
                  // Reset offer visibility for testing
                  final offerData = ref.read(creditCardOfferProvider);
                  OfferService.resetOfferVisibility(ref, offerData['id']);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Offer visibility reset!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  side: BorderSide(color: Colors.orange),
                ),
                child: Text('Reset Offer'),
              ),
            ],
          ),
        ],
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
            DefaultString.instance.userType,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: MediaQueryUtils.sp(14),
            ),
          ),
          Row(
            children: [
              Text(
                DefaultString.instance.newUser,
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
                DefaultString.instance.returningUser,
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

  Widget _buildApiTestSection(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(16)),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
        border: Border.all(color: Colors.blue),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.api, color: Colors.blue),
              SizedBox(width: MediaQueryUtils.w(8)),
              Text(
                "API INTEGRATION TEST",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[700],
                  fontSize: MediaQueryUtils.sp(14),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQueryUtils.h(12)),
          Text(
            "Tap below to test real API calls with Dio + fpdart",
            style: GoogleFonts.poppins(
              fontSize: MediaQueryUtils.sp(12),
              color: Colors.blue[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQueryUtils.h(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _testUsersApi(context, ref),
                child: Text('Test Users API'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _testUsersApi(BuildContext context, WidgetRef ref) async {
    final repository = ref.read(userRepositoryProvider);
    final result = await repository.fetchUser();
    
    result.match(
      (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Users API Error: $error'),
            backgroundColor: Colors.red,
          ),
        );
      },
      (user) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('✅ Users API Success!'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('User data from API response:'),
                SizedBox(height: 16),
                Text('Name: ${user.name}'),
                Text('Email: ${user.email}'),
                Text('Location: ${user.location}'),
                Text('ID: ${user.id}'),
                SizedBox(height: 16),
                Text(
                  '📡 API Structure: status, data, user keys',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
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
            DefaultString.instance.navigateToFeatures,
            style: GoogleFonts.poppins(
              fontSize: MediaQueryUtils.sp(19),
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(12)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _navigationButton(
                context: context,
                title: DefaultString.instance.search,
                icon: Icons.search,
                onTap: () => context.pushRoute(const UnifiedSearchRoute()),
              ),
            ),
            SizedBox(width: MediaQueryUtils.w(12)),
            Expanded(
              child: _navigationButton(
                context: context,
                title: DefaultString.instance.profile,
                icon: Icons.person,
                onTap: () => context.pushRoute(const ProfileRoute()),
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

extension on List<OfferEntity> {
  void match(Null Function(dynamic error) param0, Null Function(dynamic offers) param1) {}
}