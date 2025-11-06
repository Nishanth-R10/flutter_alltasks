// lib/features/home/presentation/pages/home_screen_content.dart
part of 'home_screen.dart';

class HomeScreenState extends ConsumerState<HomeScreen> {
  bool _isLoadingApi = false;

  @override
  void initState() {
    super.initState();
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
              SizedBox(height: MediaQueryUtils.h(20)),
              
              const QuickActions(),
              SizedBox(height: MediaQueryUtils.h(40)), 
              const OffersSection(),
              SizedBox(height: MediaQueryUtils.h(40)), 
              const ReferEarnCard(),
              SizedBox(height: MediaQueryUtils.h(20)),
              const RewardsSection(),
              
              // 🆕 Add Feedback Cards here
              SizedBox(height: MediaQueryUtils.h(40)),
              const FeedbackCards(),
              
              SizedBox(height: MediaQueryUtils.h(40)),
              const CustomizeDashboardCard(),
              SizedBox(height: MediaQueryUtils.h(20)),
              const WealthAdvisorySection(),
              SizedBox(height: MediaQueryUtils.h(40)),

              _buildNavigationSection(context),
              SizedBox(height: MediaQueryUtils.h(20)),
            ],
          ),
        ),
      ),
    );
  }
}