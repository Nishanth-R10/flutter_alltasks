
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart'; // Add shimmer package
import 'package:tasks/core/utils/media_query_utils.dart';

class OfferShimmer extends StatelessWidget {
  final double baseSize;

  const OfferShimmer({super.key, required this.baseSize});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: MediaQueryUtils.w(24)),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: MediaQueryUtils.r(20),
                offset: Offset(0, MediaQueryUtils.h(10)),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(MediaQueryUtils.w(24)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title Shimmer
                Container(
                  width: MediaQueryUtils.w(200),
                  height: MediaQueryUtils.h(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
                  ),
                ),
                SizedBox(height: MediaQueryUtils.h(20)),

                // Content Row Shimmer
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Stack Shimmer
                    SizedBox(
                      width: MediaQueryUtils.w(100),
                      height: MediaQueryUtils.h(80),
                      child: Stack(
                        children: [
                          // Background Card Shimmer
                          Positioned(
                            right: MediaQueryUtils.w(0),
                            top: MediaQueryUtils.h(0),
                            child: Container(
                              width: MediaQueryUtils.w(75),
                              height: MediaQueryUtils.h(50),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
                              ),
                            ),
                          ),
                          // Foreground Card Shimmer
                          Positioned(
                            left: MediaQueryUtils.w(15),
                            top: MediaQueryUtils.h(15),
                            child: Container(
                              width: MediaQueryUtils.w(75),
                              height: MediaQueryUtils.h(50),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: MediaQueryUtils.w(16)),

                    // Description Shimmer
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQueryUtils.h(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
                            ),
                          ),
                          SizedBox(height: MediaQueryUtils.h(8)),
                          Container(
                            width: MediaQueryUtils.w(150),
                            height: MediaQueryUtils.h(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
                            ),
                          ),
                          SizedBox(height: MediaQueryUtils.h(8)),
                          Container(
                            width: MediaQueryUtils.w(120),
                            height: MediaQueryUtils.h(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQueryUtils.h(24)),

                // Checkbox Shimmer
                Row(
                  children: [
                    Container(
                      width: MediaQueryUtils.w(20),
                      height: MediaQueryUtils.h(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
                      ),
                    ),
                    SizedBox(width: MediaQueryUtils.w(8)),
                    Container(
                      width: MediaQueryUtils.w(150),
                      height: MediaQueryUtils.h(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQueryUtils.h(20)),

                // Buttons Shimmer
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQueryUtils.h(50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(MediaQueryUtils.r(25)),
                      ),
                    ),
                    SizedBox(height: MediaQueryUtils.h(12)),
                    Container(
                      width: double.infinity,
                      height: MediaQueryUtils.h(50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(MediaQueryUtils.r(25)),
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

