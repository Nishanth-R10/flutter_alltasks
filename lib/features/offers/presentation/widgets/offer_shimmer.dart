import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_colors/default_colors.dart';

class OfferShimmer extends StatelessWidget {
  final double baseSize;

  const OfferShimmer({super.key, required this.baseSize});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06), 
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
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.06), 
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title Shimmer
                Container(
                  width: screenWidth * 0.5, 
                  height: screenHeight * 0.03, 
                  decoration: BoxDecoration(
                    color: DefaultColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: screenHeight * 0.025), 

                // Content Row Shimmer
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Stack Shimmer
                    SizedBox(
                      width: screenWidth * 0.25,
                      height: screenHeight * 0.1, 
                      child: Stack(
                        children: [
                          // Background Card Shimmer
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
                          // Foreground Card Shimmer
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

                    // Description Shimmer
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: screenHeight * 0.02, 
                            decoration: BoxDecoration(
                              color: DefaultColors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01), 
                          Container(
                            width: screenWidth * 0.375, 
                            height: screenHeight * 0.02, 
                            decoration: BoxDecoration(
                              color: DefaultColors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Container(
                            width: screenWidth * 0.3, 
                            height: screenHeight * 0.02, 
                            decoration: BoxDecoration(
                              color: DefaultColors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03), 

                // Checkbox Shimmer
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.05,
                      height: screenHeight * 0.025, 
                      decoration: BoxDecoration(
                        color: DefaultColors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02), 
                    Container(
                      width: screenWidth * 0.375, 
                      height: screenHeight * 0.02, 
                      decoration: BoxDecoration(
                        color: DefaultColors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.025), 

                // Buttons Shimmer
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.0625, 
                      decoration: BoxDecoration(
                        color: DefaultColors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015), 
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.0625, 
                      decoration: BoxDecoration(
                        color: DefaultColors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}