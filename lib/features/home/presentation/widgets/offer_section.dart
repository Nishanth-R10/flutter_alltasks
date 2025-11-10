import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/app_colors/default_colors.dart';
import 'package:tasks/features/home/data/static_home_data.dart' show StaticHomeData;
import 'package:tasks/features/home/presentation/controller/home_providers.dart';
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
        /// HEADER
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Text(
            "Offers",
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w700,
              color: DefaultColors.black,
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
              return _buildOfferCard(context, screenWidth, screenHeight);
            },
          ),
        ),

        SizedBox(height: screenHeight * 0.03),

        /// SECOND CONTAINER
        Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
          padding: EdgeInsets.all(screenWidth * 0.05),
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
              _buildToggleButtons(context, ref, selectedTab, screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
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
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// MAIN CARD
          Container(
            padding: EdgeInsets.all(screenWidth * 0.06),
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
                  style: TextStyle(
                    fontSize: screenWidth * 0.042,
                    fontWeight: FontWeight.w700,
                    color: DefaultColors.black,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  "With Dukhan Bank VIA Infinite Credit Card.",
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.w400,
                    color: DefaultColors.black.withOpacity(0.7),
                    height: 1.3,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DefaultColors.blueLightBase,
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
                          "Learn More",
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

  Widget _buildToggleButtons(BuildContext context, WidgetRef ref, int selectedTab, double screenWidth, double screenHeight) {
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
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.015,
              ),
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
              backgroundColor: selectedTab == 1 ? DefaultColors.blueLightBase : Colors.transparent,
              foregroundColor: selectedTab == 1 ? Colors.white : DefaultColors.black.withOpacity(0.6),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
              ),
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
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: screenWidth * 0.01),
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  decoration: BoxDecoration(
                    color: DefaultColors.redDB,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "3",
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

  // CHANGE THIS METHOD - Use Map instead of OfferEntity
  Widget _buildOffersList(BuildContext context, List<Map<String, dynamic>> offers, double screenWidth, double screenHeight) {
    final totalItems = offers.length + 1;

    return SizedBox(
      height: screenHeight * 0.125,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: totalItems,
        separatorBuilder: (_, __) => SizedBox(width: screenWidth * 0.02),
        itemBuilder: (context, index) {
          if (index == offers.length) {
            return _buildViewMoreItem(context, screenWidth, screenHeight);
          }

          final offer = offers[index];
          return OfferItem(
            offerData: offer, // Pass Map data
            onTap: () {},
          );
        },
      ),
    );
  }

  Widget _buildViewMoreItem(BuildContext context, double screenWidth, double screenHeight) {
    return SizedBox(
      width: screenWidth * 0.2,
      child: Column(
        children: [
          Container(
            width: screenWidth * 0.15,
            height: screenWidth * 0.15,
            decoration: BoxDecoration(
              color: DefaultColors.blueLightBase.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.north_east,
              color: DefaultColors.blueLightBase,
              size: screenWidth * 0.07,
            ),
          ),
          SizedBox(height: screenHeight * 0.008),
          Text(
            "View\nMore",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.028,
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