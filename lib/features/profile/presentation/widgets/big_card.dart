import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/app_colors/default_colors.dart';

class BigCard extends StatelessWidget {
  final String title;
  final String imageAsset;
  final double fontScale;
  final bool isLoading;

  const BigCard({
    super.key,
    required this.title,
    required this.imageAsset,
    this.fontScale = 12.0,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    const cardRadius = 16.0; // ❌ fixed radius
    const padding = 12.0;

    if (isLoading) {
      return _buildShimmerBigCard(screenWidth, cardRadius, padding);
    }

    return Material(
      color: DefaultColors.white,
      borderRadius: BorderRadius.circular(cardRadius),
      elevation: 1.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(cardRadius),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // ❌ fixed radius
                child: Image.asset(
                  imageAsset,
                  width: screenWidth * 0.25,
                  height: screenWidth * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: screenWidth * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        color: DefaultColors.dashboardBlue,
                        fontSize: fontScale, // ❌ fixed font size
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.north_east, size: screenWidth * 0.04, color: DefaultColors.dashboardBlue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerBigCard(double screenWidth, double cardRadius, double padding) {
    return Shimmer.fromColors(
      baseColor: DefaultColors.grayE6,
      highlightColor: DefaultColors.white,
      child: Material(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(cardRadius),
        elevation: 1.0,
        child: Padding(
          padding:  EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenWidth * 0.25,
                height: screenWidth * 0.25,
                decoration: BoxDecoration(
                  color: DefaultColors.grayE6,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              SizedBox(height: screenWidth * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: DefaultColors.grayE6,
                        borderRadius: BorderRadius.circular(4.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
