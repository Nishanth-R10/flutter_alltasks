import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/providers/theme_provider.dart';
import 'package:tasks/features/home/presentation/controller/home_providers.dart';
import 'package:tasks/features/home/presentation/widgets/offer_item.dart';
import 'package:tasks/features/home/presentation/widgets/shimmer_widget.dart';

class OffersSection extends ConsumerWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final offersAsync = ref.watch(offersFutureProvider);
    final selectedTab = ref.watch(selectedOfferTabProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// HEADER
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Text(
            'Offers',
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.015),

        /// FIRST CARD LIST
        SizedBox(
          height: screenHeight * 0.22,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: screenWidth * 0.01),
            itemCount: 3,
            itemBuilder: (context, _) {
              return _buildOfferCard(context, ref);
            },
          ),
        ),

        SizedBox(height: screenHeight * 0.03),

        /// SECOND CONTAINER
        Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
          padding: EdgeInsets.all(screenWidth * 0.05),
          decoration: BoxDecoration(
            color: theme.cardTheme.color,
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
              SizedBox(height: screenHeight * 0.02),
              _buildOriginalOffersSection(context, ref),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOfferCard(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.85,
      height: screenHeight * 0.22,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// MAIN CARD
          Container(
            padding: EdgeInsets.all(screenWidth * 0.06),
            decoration: BoxDecoration(
              color: theme.cardTheme.color,
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
                  'A new dimension of benefits and\nRewards',
                  style: TextStyle(
                    fontSize: screenWidth * 0.042,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurface,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  'With Dukhan Bank VIA Infinite Credit Card.',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                    height: 1.3,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.045,
                        vertical: screenHeight * 0.011,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Learn More',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.032,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.012),
                        Icon(
                          Icons.north_east,
                          color: Colors.white,
                          size: screenWidth * 0.038,
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
    final theme = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              ref.read(selectedOfferTabProvider.notifier).state = 0;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedTab == 0 ? theme.colorScheme.primary : Colors.transparent,
              foregroundColor: selectedTab == 0 ? Colors.white : theme.colorScheme.onSurface.withOpacity(0.6),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.015,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: selectedTab == 0
                    ? BorderSide.none
                    : BorderSide(color: theme.dividerColor!, width: 1),
              ),
              elevation: 0,
            ),
            child: Text(
              'Instant Discounts',
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              ref.read(selectedOfferTabProvider.notifier).state = 1;
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: selectedTab == 1 ? theme.colorScheme.primary : Colors.transparent,
              foregroundColor: selectedTab == 1 ? Colors.white : theme.colorScheme.onSurface.withOpacity(0.6),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
              ),
              side: selectedTab == 1
                  ? BorderSide.none
                  : BorderSide(color: theme.dividerColor!, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cash Bonus',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: screenWidth * 0.01),
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE57373),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.025,
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

  Widget _buildOriginalOffersSection(BuildContext context, WidgetRef ref) {
    final offersAsync = ref.watch(offersFutureProvider);
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.125,
      child: offersAsync.when(
        loading: () => _buildOffersShimmer(context, ref),
        error: (error, stack) => _buildOffersError(context, error, ref),
        data: (offers) => _buildOffersList(context, ref, offers),
      ),
    );
  }

  Widget _buildOffersList(BuildContext context, WidgetRef ref, List<dynamic> offers) {
    final screenWidth = MediaQuery.of(context).size.width;

    final totalItems = offers.length + 1;

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: totalItems,
      separatorBuilder: (_, __) => SizedBox(width: screenWidth * 0.02),
      itemBuilder: (context, index) {
        if (index == offers.length) {
          return _buildViewMoreItem(context, ref);
        }

        final item = offers[index];
        return OfferItem(
          offerView: item,
          onTap: () {},
        );
      },
    );
  }

  Widget _buildViewMoreItem(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.2,
      child: Column(
        children: [
          Container(
            width: screenWidth * 0.15,
            height: screenWidth * 0.15,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.north_east,
              color: theme.colorScheme.primary,
              size: screenWidth * 0.07,
            ),
          ),
          SizedBox(height: screenHeight * 0.008),
          Text(
            'View\nMore',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.028,
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onSurface,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOffersShimmer(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      separatorBuilder: (_, __) => SizedBox(width: screenWidth * 0.03),
      itemBuilder: (context, index) {
        return ShimmerWidget(
          child: SizedBox(
            width: screenWidth * 0.2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: screenWidth * 0.15,
                  height: screenWidth * 0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.dividerColor,
                  ),
                ),
                SizedBox(height: screenHeight * 0.008),
                Container(
                  width: screenWidth * 0.16,
                  height: screenHeight * 0.012,
                  decoration: BoxDecoration(
                    color: theme.dividerColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOffersError(BuildContext context, Object error, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline,
              color: Colors.red, size: screenWidth * 0.06),
          SizedBox(height: screenHeight * 0.01),
          Text(
            'Failed to load offers',
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: Colors.red,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          ElevatedButton(
            onPressed: () => ref.invalidate(offersFutureProvider),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
                vertical: screenHeight * 0.008,
              ),
            ),
            child: Text(
              'Retry',
              style: TextStyle(fontSize: screenWidth * 0.025),
            ),
          ),
        ],
      ),
    );
  }
}