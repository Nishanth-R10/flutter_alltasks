// lib/features/home/presentation/pages/home_screen_content.dart
part of '../../home_screen.dart';

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
              //_buildUserTypeToggle(ref),
             // SizedBox(height: MediaQueryUtils.h(20)),
              
              //_buildApiTestSection(context, ref),
             /// SizedBox(height: MediaQueryUtils.h(20)),
              
              //_buildCreditCardOfferSection(context, ref),
              SizedBox(height: MediaQueryUtils.h(20)),
              
              const QuickActions(),
              SizedBox(height: MediaQueryUtils.h(40)), 
              const RewardsSection(),
              SizedBox(height: MediaQueryUtils.h(40)), 
              const OffersSection(),
              SizedBox(height: MediaQueryUtils.h(20)),
              const ReferEarnCard(),
              
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