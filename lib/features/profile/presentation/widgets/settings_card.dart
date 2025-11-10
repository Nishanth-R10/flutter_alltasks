import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks/core/constants/app_colors/default_colors.dart';

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
    final horizontalPadding = 16.0;
    final verticalPadding = bigCard ? 16.0 : 16.0;

    if (isLoading) {
      return _buildShimmerSettingCard(context, horizontalPadding, verticalPadding, screenWidth);
    }

    return Material(
      color: DefaultColors.white,
      borderRadius: BorderRadius.circular(16.0),
      elevation: 1.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showCircle)
                Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    color: DefaultColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: DefaultColors.grayE6,
                      width: 1.5,
                    ),
                  ),
                ),
              if (showCircle) const SizedBox(width: 16.0),
              if (icon != null) Icon(
                icon, 
                size: 24.0, 
                color: DefaultColors.black,
              ),
              if (icon != null) const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: fontScale,
                    fontWeight: FontWeight.w600,
                    color: DefaultColors.dashboardBlue,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.north_east, size: 16.0, color: DefaultColors.dashboardBlue),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerSettingCard(BuildContext context, double horizontalPadding, double verticalPadding, double screenWidth) {
    return Shimmer.fromColors(
      baseColor: DefaultColors.grayE6,
      highlightColor: DefaultColors.white,
      child: Material(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(16.0),
        elevation: 1.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 24.0,
                height: 24.0,
                decoration: BoxDecoration(
                  color: DefaultColors.grayE6,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Container(
                  height: fontScale,
                  decoration: BoxDecoration(
                    color: DefaultColors.grayE6,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              Container(
                width: 16.0,
                height: 16.0,
                decoration: BoxDecoration(
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