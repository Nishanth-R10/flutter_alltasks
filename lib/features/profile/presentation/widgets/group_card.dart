import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks/core/constants/app_colors/default_colors.dart';

class GroupCard extends StatelessWidget {
  final List<String> titles;
  final double fontScale;
  final bool isLoading;
  const GroupCard({
    super.key, 
    required this.titles, 
    required this.fontScale,
    this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final borderRadius = 16.0;
    
    if (isLoading) {
      return _buildShimmerGroupCard(context, borderRadius, screenWidth);
    }
    
    return Material(
      color: DefaultColors.white,
      borderRadius: BorderRadius.circular(borderRadius),
      elevation: 0.5,
      child: Column(
        children: List.generate(titles.length, (index) {
          final isLast = index == titles.length - 1;
          return InkWell(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(index == 0 ? borderRadius : 0),
              topRight: Radius.circular(index == 0 ? borderRadius : 0),
              bottomLeft: Radius.circular(isLast ? borderRadius : 0),
              bottomRight: Radius.circular(isLast ? borderRadius : 0),
            ),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Row(
                children: [
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
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      titles[index],
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
          );
        }),
      ),
    );
  }

  Widget _buildShimmerGroupCard(BuildContext context, double borderRadius, double screenWidth) {
    return Shimmer.fromColors(
      baseColor: DefaultColors.grayE6,
      highlightColor: DefaultColors.white,
      child: Material(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        elevation: 0.5,
        child: Column(
          children: List.generate(3, (index) {
            final isLast = index == 2;
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Row(
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
            );
          }),
        ),
      ),
    );
  }
}