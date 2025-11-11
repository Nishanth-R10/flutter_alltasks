import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/app_colors/default_colors.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final bool compact;
  final bool bigCard;
  final bool verticalLayout;
  final IconData? icon;
  final double fontScale;
  final bool showCircle;
  final bool isLoading;

  const SettingCard({
    super.key,
    required this.title,
    this.compact = false,
    this.bigCard = false,
    this.verticalLayout = false,
    this.icon,
    this.fontScale = 14.0,
    this.showCircle = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ❌ No MediaQuery for padding or radius
    const horizontalPadding = 16.0;
    const verticalPadding = 16.0;
    const cardRadius = 16.0;

    if (isLoading) {
      return _buildShimmerSettingCard(screenWidth, horizontalPadding, verticalPadding, cardRadius);
    }

    return Material(
      color: DefaultColors.white,
      borderRadius: BorderRadius.circular(cardRadius),
      elevation: 1.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(cardRadius),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showCircle)
                Container(
                  width: screenWidth * 0.06,
                  height: screenWidth * 0.06,
                  decoration: BoxDecoration(
                    color: DefaultColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: DefaultColors.grayE6, width: 1.5),
                  ),
                ),
              if (showCircle) SizedBox(width: screenWidth * 0.04),
              if (icon != null)
                Icon(icon, size: screenWidth * 0.06, color: DefaultColors.black),
              if (icon != null) SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: fontScale, // ❌ no MediaQuery
                    fontWeight: FontWeight.w600,
                    color: DefaultColors.dashboardBlue,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.north_east, size: screenWidth * 0.04, color: DefaultColors.dashboardBlue),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerSettingCard(
    double screenWidth,
    double horizontalPadding,
    double verticalPadding,
    double cardRadius,
  ) {
    return Shimmer.fromColors(
      baseColor: DefaultColors.grayE6,
      highlightColor: DefaultColors.white,
      child: Material(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(cardRadius),
        elevation: 1.0,
        child: Container(
          padding:  EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.06,
                height: screenWidth * 0.06,
                decoration: const BoxDecoration(
                  color: DefaultColors.grayE6,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Container(
                  height: 14.0,
                  decoration: BoxDecoration(
                    color: DefaultColors.grayE6,
                    borderRadius: BorderRadius.circular(4.0), // ❌ fixed radius
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.04,
                height: screenWidth * 0.04,
                decoration: const BoxDecoration(
                  color: DefaultColors.grayE6,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
