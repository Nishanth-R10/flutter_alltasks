// lib/features/search/presentation/widgets/financial_services/feature_container.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/search/domain/entities/whats_new_entity.dart';
import 'package:tasks/features/search/presentation/widgets/common/shimmer_loading.dart';
import 'package:tasks/features/search/providers/search_providers.dart';

class FeatureContainerRow extends ConsumerWidget {
  const FeatureContainerRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryUtils.init(context);
    final whatsNewResult = ref.watch(whatsNewFeaturesProvider);

    return whatsNewResult.when(
      loading: () => _buildShimmerFeatures(),
      error: (error, stack) {
        // Log error and show fallback
        debugPrint('FeatureContainerRow error: $error');
        return _buildFallbackFeatures();
      },
      data: (features) {
        if (features.isEmpty) {
          return _buildFallbackFeatures();
        }
        return _buildFeaturesFromApi(features);
      },
    );
  }

  Widget _buildFeaturesFromApi(List<WhatsNewEntity> features) {
    final displayFeatures = features.take(2).toList();
    
    return Row(
      children: [
        if (displayFeatures.isNotEmpty)
          Expanded(
            child: _buildFeatureContainer(
              displayFeatures[0].title,
              displayFeatures[0].imagePath,
            ),
          ),
        if (displayFeatures.length > 1) ...[
          SizedBox(width: MediaQueryUtils.w(12)),
          Expanded(
            child: _buildFeatureContainer(
              displayFeatures[1].title,
              displayFeatures[1].imagePath,
            ),
          ),
        ],
        // If only one feature, add empty container to maintain layout
        if (displayFeatures.length == 1)
          Expanded(child: Container()),
      ],
    );
  }

  Widget _buildFallbackFeatures() {
    return Row(
      children: [
        Expanded(
          child: _buildFeatureContainer(
            'Track Spends',
            'assets/images/discovery.png',
          ),
        ),
        SizedBox(width: MediaQueryUtils.w(12)),
        Expanded(
          child: _buildFeatureContainer(
            'Track Forex',
            'assets/images/discovery.png',
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerFeatures() {
    return Row(
      children: [
        Expanded(
          child: ShimmerLoading(
            isLoading: true,
            child: _buildShimmerContainer(),
          ),
        ),
        SizedBox(width: MediaQueryUtils.w(12)),
        Expanded(
          child: ShimmerLoading(
            isLoading: true,
            child: _buildShimmerContainer(),
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerContainer() {
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(8)),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQueryUtils.w(80),
            height: MediaQueryUtils.h(80),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
            ),
          ),
          SizedBox(height: MediaQueryUtils.h(8)),
          Container(
            width: double.infinity,
            height: MediaQueryUtils.h(16),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureContainer(String title, String imagePath) {
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(8)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: MediaQueryUtils.r(8),
            offset: Offset(0, MediaQueryUtils.h(4)),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
            child: Image.asset(
              imagePath,
              width: MediaQueryUtils.w(80),
              height: MediaQueryUtils.h(80),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback if image fails to load
                return Container(
                  width: MediaQueryUtils.w(80),
                  height: MediaQueryUtils.h(80),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
                  ),
                  child: Icon(
                    Icons.image,
                    size: MediaQueryUtils.w(40),
                    color: Colors.grey[400],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: MediaQueryUtils.h(8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: MediaQueryUtils.sp(14),
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.north_east,
                size: MediaQueryUtils.sp(14),
                color: Colors.black87,
              ),
            ],
          ),
        ],
      ),
    );
  }
}