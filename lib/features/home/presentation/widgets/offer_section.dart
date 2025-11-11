import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors/default_colors.dart';
import '../../data/static_home_data.dart';
import '../controller/home_providers.dart';
import 'offer_item.dart';

class OffersSection extends ConsumerWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offers = StaticHomeData.offersData; 
    final selectedTab = ref.watch(selectedOfferTabProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Offers",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: DefaultColors.black,
            ),
          ),
        ),
        const SizedBox(height: 12),

        SizedBox(
          height: screenHeight * 0.22,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 4),
            itemCount: 3,
            itemBuilder: (context, _) {
              return _buildOfferCard(context, screenWidth, screenHeight);
            },
          ),
        ),

        const SizedBox(height: 24),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: DefaultColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildToggleButtons(context, ref, selectedTab),
              const SizedBox(height: 16),
              _buildOffersList(context, offers, screenWidth, screenHeight),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOfferCard(BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.85,
      height: screenHeight * 0.22,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: DefaultColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "A new dimension of benefits and\nRewards",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: DefaultColors.black,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "With Dukhan Bank VIA Infinite Credit Card.",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: DefaultColors.black.withOpacity(0.7),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 16),

                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DefaultColors.blueLightBase,
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Learn More",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.north_east,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: screenHeight * 0.055,
            left: screenWidth * 0.05,
            child: ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                heightFactor: 0.6,
                child: SizedBox(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.12,
                  child: Image.asset(
                    'assets/images/black.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButtons(BuildContext context, WidgetRef ref, int selectedTab) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              ref.read(selectedOfferTabProvider.notifier).state = 0;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedTab == 0 ? DefaultColors.blueLightBase : Colors.transparent,
              foregroundColor: selectedTab == 0 ? Colors.white : DefaultColors.black.withOpacity(0.6),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: selectedTab == 0
                    ? BorderSide.none
                    : BorderSide(color: DefaultColors.grayCA, width: 1),
              ),
              elevation: 0,
            ),
            child: Text(
              "Instant Discounts",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              ref.read(selectedOfferTabProvider.notifier).state = 1;
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: selectedTab == 1 ? DefaultColors.blueLightBase : Colors.transparent,
              foregroundColor: selectedTab == 1 ? Colors.white : DefaultColors.black.withOpacity(0.6),
              padding: const EdgeInsets.symmetric(vertical: 8),
              side: selectedTab == 1
                  ? BorderSide.none
                  : BorderSide(color: DefaultColors.grayCA, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cash Bonus",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: DefaultColors.redDB,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "3",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOffersList(BuildContext context, List<Map<String, dynamic>> offers, double screenWidth, double screenHeight) {
    final totalItems = offers.length + 1;

    return SizedBox(
      height: screenHeight * 0.125,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: totalItems,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (index == offers.length) {
            return _buildViewMoreItem(context);
          }

          final offer = offers[index];
          return OfferItem(
            offerData: offer,
            onTap: () {},
          );
        },
      ),
    );
  }

  Widget _buildViewMoreItem(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: DefaultColors.blueLightBase.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.north_east,
              color: DefaultColors.blueLightBase,
              size: 28,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "View\nMore",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: DefaultColors.black,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}