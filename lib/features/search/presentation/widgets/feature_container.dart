

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors/default_colors.dart';
import '../controller/search_provider.dart';
import 'shimmer_loading.dart';

class FeatureContainer extends ConsumerWidget {
  const FeatureContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final whatsNewResult = ref.watch(whatsNewFeaturesProvider);

    return whatsNewResult.when(
      loading: () => _buildShimmerFeatures(context, screenWidth),
      error: (error, stack) => _buildFallbackFeatures(context, screenWidth),
      data: (features) => features.isEmpty 
          ? _buildFallbackFeatures(context, screenWidth)
          : _buildFeaturesFromData(context, features, screenWidth),
    );
  }

  Widget _buildFeaturesFromData(BuildContext context, List features, double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: _buildFeatureContainer(
            context,
            features[0]['title'],
            features[0]['imagePath'],
            screenWidth,
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: features.length > 1
              ? _buildFeatureContainer(
                  context,
                  features[1]['title'],
                  features[1]['imagePath'],
                  screenWidth,
                )
              : Container(),
        ),
      ],
    );
  }

  Widget _buildFallbackFeatures(BuildContext context, double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: _buildFeatureContainer(
            context,
            'Track Spends',
            'assets/images/discovery.png',
            screenWidth,
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: _buildFeatureContainer(
            context,
            'Track Forex',
            'assets/images/discovery.png',
            screenWidth,
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerFeatures(BuildContext context, double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: ShimmerLoading(
            isLoading: true,
            child: _buildShimmerContainer(context, screenWidth),
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: ShimmerLoading(
            isLoading: true,
            child: _buildShimmerContainer(context, screenWidth),
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerContainer(BuildContext context, double screenWidth) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DefaultColors.grayE6,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth * 0.2,
            height: screenWidth * 0.2,
            decoration: BoxDecoration(
              color: DefaultColors.grayCA,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: screenHeight * 0.02,
            decoration: BoxDecoration(
              color: DefaultColors.grayCA,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureContainer(BuildContext context, String title, String imagePath, double screenWidth) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: DefaultColors.grayCA),
        boxShadow: [
          BoxShadow(
            color: DefaultColors.black.withOpacity(0.05),
            blurRadius: screenWidth * 0.02,
            offset: Offset(0, screenWidth * 0.01),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  decoration: BoxDecoration(
                    color: DefaultColors.grayE6,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.image,
                    size: screenWidth * 0.1,
                    color: DefaultColors.grayCA,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: DefaultColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.north_east,
                size: screenWidth * 0.035,
                color: DefaultColors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}