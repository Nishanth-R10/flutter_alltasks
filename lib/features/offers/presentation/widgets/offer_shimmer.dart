import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/app_colors/default_colors.dart';

class OfferShimmer extends StatelessWidget {
  const OfferShimmer({super.key});

  @override
  Widget build(BuildContext context) {
  //  final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Shimmer.fromColors(
        baseColor: DefaultColors.grayE6,
        highlightColor: DefaultColors.grayFB,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: DefaultColors.white,
            borderRadius: BorderRadius.circular(16),  
            boxShadow: [
              BoxShadow(
                color: DefaultColors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.all(24), 
            child: _ShimmerBody(),
          ),
        ),
      ),
    );
  }
}

class _ShimmerBody extends StatelessWidget {
  const _ShimmerBody();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
   final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: screenWidth * 0.5,
          height: screenHeight * 0.03,
          decoration: BoxDecoration(
            color: DefaultColors.white,
            borderRadius: BorderRadius.circular(8), // ✅ fixed radius
          ),
        ),
        SizedBox(height: screenHeight * 0.025),

        // Image shimmer placeholders
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth * 0.25,
              height: screenHeight * 0.1,
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: screenWidth * 0.1875,
                      height: screenHeight * 0.0625,
                      decoration: BoxDecoration(
                        color: DefaultColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.0375,
                    top: screenHeight * 0.01875,
                    child: Container(
                      width: screenWidth * 0.1875,
                      height: screenHeight * 0.0625,
                      decoration: BoxDecoration(
                        color: DefaultColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.04),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.02,
                    decoration: BoxDecoration(
                      color: DefaultColors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    width: screenWidth * 0.375,
                    height: screenHeight * 0.02,
                    decoration: BoxDecoration(
                      color: DefaultColors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.02,
                    decoration: BoxDecoration(
                      color: DefaultColors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.03),

        // Offer label shimmer
        Row(
          children: [
            Container(
              width: screenWidth * 0.05,
              height: screenHeight * 0.025,
              decoration: BoxDecoration(
                color: DefaultColors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            Container(
              width: screenWidth * 0.375,
              height: screenHeight * 0.02,
              decoration: BoxDecoration(
                color: DefaultColors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.025),

        // Buttons shimmer
        Column(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.0625,
              decoration: BoxDecoration(
                color: DefaultColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Container(
              width: double.infinity,
              height: screenHeight * 0.0625,
              decoration: BoxDecoration(
                color: DefaultColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
