import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/app_colors/default_colors.dart';

class GroupCard extends StatelessWidget {
  final List<String> titles;
  final double fontScale;
  final bool isLoading;

  const GroupCard({
    super.key,
    required this.titles,
    required this.fontScale,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    const cardRadius = 16.0; // ❌ fixed radius
    const padding = 16.0;

    if (isLoading) {
      return _buildShimmerGroupCard(screenWidth, cardRadius, padding);
    }

    return Material(
      color: DefaultColors.white,
      borderRadius: BorderRadius.circular(cardRadius),
      elevation: 0.5,
      child: Column(
        children: List.generate(titles.length, (index) {
          final isLast = index == titles.length - 1;
          return InkWell(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(index == 0 ? cardRadius : 0),
              topRight: Radius.circular(index == 0 ? cardRadius : 0),
              bottomLeft: Radius.circular(isLast ? cardRadius : 0),
              bottomRight: Radius.circular(isLast ? cardRadius : 0),
            ),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
              child: Row(
                children: [
                  Container(
                    width: screenWidth * 0.06,
                    height: screenWidth * 0.06,
                    decoration: BoxDecoration(
                      color: DefaultColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: DefaultColors.grayE6, width: 1.5),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  Expanded(
                    child: Text(
                      titles[index],
                      style: GoogleFonts.poppins(
                        fontSize: fontScale, // ❌ fixed font size
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
          );
        }),
      ),
    );
  }

  Widget _buildShimmerGroupCard(double screenWidth, double cardRadius, double padding) {
    return Shimmer.fromColors(
      baseColor: DefaultColors.grayE6,
      highlightColor: DefaultColors.white,
      child: Material(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(cardRadius),
        elevation: 0.5,
        child: Column(
          children: List.generate(3, (index) {
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: padding, vertical: padding),
              child: Row(
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
                      height: screenWidth * 0.03,
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
            );
          }),
        ),
      ),
    );
  }
}
