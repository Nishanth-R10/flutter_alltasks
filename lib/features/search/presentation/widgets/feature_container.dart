// feature_container.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_colors/default_colors.dart';
import 'package:tasks/features/search/presentation/controller/search_provider.dart';
import 'shimmer_loading.dart';

class FeatureContainer extends ConsumerWidget {
  const FeatureContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseSize = MediaQuery.of(context).size.shortestSide * 0.01;
    final whatsNewResult = ref.watch(whatsNewFeaturesProvider);

    return whatsNewResult.when(
      loading: () => _buildShimmerFeatures(context, isDark, baseSize),
      error: (error, stack) => _buildFallbackFeatures(context, isDark, baseSize),
      data: (features) => features.isEmpty 
          ? _buildFallbackFeatures(context, isDark, baseSize)
          : _buildFeaturesFromData(context, features, isDark, baseSize),
    );
  }

  Widget _buildFeaturesFromData(BuildContext context, List features, bool isDark, double baseSize) {
    return Row(
      children: [
        Expanded(
          child: _buildFeatureContainer(
            context,
            features[0]['title'],
            features[0]['imagePath'],
            isDark,
            baseSize,
          ),
        ),
        SizedBox(width: baseSize * 3),
        Expanded(
          child: features.length > 1
              ? _buildFeatureContainer(
                  context,
                  features[1]['title'],
                  features[1]['imagePath'],
                  isDark,
                  baseSize,
                )
              : Container(),
        ),
      ],
    );
  }

  Widget _buildFallbackFeatures(BuildContext context, bool isDark, double baseSize) {
    return Row(
      children: [
        Expanded(
          child: _buildFeatureContainer(
            context,
            'Track Spends',
            'assets/images/discovery.png',
            isDark,
            baseSize,
          ),
        ),
        SizedBox(width: baseSize * 3),
        Expanded(
          child: _buildFeatureContainer(
            context,
            'Track Forex',
            'assets/images/discovery.png',
            isDark,
            baseSize,
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerFeatures(BuildContext context, bool isDark, double baseSize) {
    return Row(
      children: [
        Expanded(
          child: ShimmerLoading(
            isLoading: true,
            child: _buildShimmerContainer(context, isDark, baseSize),
          ),
        ),
        SizedBox(width: baseSize * 3),
        Expanded(
          child: ShimmerLoading(
            isLoading: true,
            child: _buildShimmerContainer(context, isDark, baseSize),
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerContainer(BuildContext context, bool isDark, double baseSize) {
    return Container(
      padding: EdgeInsets.all(baseSize * 2),
      decoration: BoxDecoration(
        color: isDark ? DefaultColors.gray7D : DefaultColors.grayE6,
        borderRadius: BorderRadius.circular(baseSize * 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: baseSize * 20,
            height: baseSize * 20,
            decoration: BoxDecoration(
              color: isDark ? DefaultColors.gray62 : DefaultColors.grayCA,
              borderRadius: BorderRadius.circular(baseSize * 2),
            ),
          ),
          SizedBox(height: baseSize * 2),
          Container(
            width: double.infinity,
            height: baseSize * 4,
            decoration: BoxDecoration(
              color: isDark ? DefaultColors.gray62 : DefaultColors.grayCA,
              borderRadius: BorderRadius.circular(baseSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureContainer(BuildContext context, String title, String imagePath, bool isDark, double baseSize) {
    return Container(
      padding: EdgeInsets.all(baseSize * 2),
      decoration: BoxDecoration(
        color: isDark ? DefaultColors.black24 : DefaultColors.white,
        borderRadius: BorderRadius.circular(baseSize * 3),
        border: Border.all(color: isDark ? DefaultColors.gray7D : DefaultColors.grayCA),
        boxShadow: [
          BoxShadow(
            color: DefaultColors.black.withOpacity(0.05),
            blurRadius: baseSize * 2,
            offset: Offset(0, baseSize),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(baseSize * 2),
            child: Image.asset(
              imagePath,
              width: baseSize * 20,
              height: baseSize * 20,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: baseSize * 20,
                  height: baseSize * 20,
                  decoration: BoxDecoration(
                    color: isDark ? DefaultColors.gray7D : DefaultColors.grayE6,
                    borderRadius: BorderRadius.circular(baseSize * 2),
                  ),
                  child: Icon(
                    Icons.image,
                    size: baseSize * 10,
                    color: isDark ? DefaultColors.gray62 : DefaultColors.grayCA,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: baseSize * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: baseSize * 3.5,
                    color: isDark ? DefaultColors.white : DefaultColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.north_east,
                size: baseSize * 3.5,
                color: isDark ? DefaultColors.white : DefaultColors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}