<<<<<<< HEAD
// lib/features/search/presentation/widgets/financial_services/feature_container.dart
// ignore_for_file: deprecated_member_use

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
      error: (error, stack) => _buildFallbackFeatures(),
      data: (features) => _buildFeaturesFromApi(features),
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
=======
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';

class FeatureContainerRow extends StatelessWidget {
  final double baseSize;

  const FeatureContainerRow({
    super.key,
    required this.baseSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildFeatureContainer(
            DefaultString.instance.trackSpends,
            "assets/images/discovery.png",
            baseSize,
          ),
        ),
        SizedBox(width: baseSize * 3),
        Expanded(
          child: _buildFeatureContainer(
            DefaultString.instance.trackForex,
            "assets/images/discovery.png",
            baseSize,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureContainer(String title, String imagePath, double baseSize) {
    return Container(
      padding: EdgeInsets.all(baseSize * 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(baseSize * 3),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with rounded corners - no grey background
          ClipRRect(
            borderRadius: BorderRadius.circular(baseSize * 2),
            child: Image.asset(
              "assets/images/discovery.png",
              width: baseSize * 25,
              height: baseSize * 25,
              fit: BoxFit.cover,
            ),
          ),
          
          SizedBox(height: baseSize * 2),
          
          // Title and arrow at the bottom
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: baseSize * 3.5,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.north_east,
                size: baseSize * 3.5,
                color: Colors.black87,
              ),
            ],
          ),
        ],
      ),
    );
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}