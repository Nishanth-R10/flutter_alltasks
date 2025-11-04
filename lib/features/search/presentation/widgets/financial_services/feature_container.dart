import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/search/domain/entities/whats_new_entity.dart';
import 'package:tasks/features/search/presentation/widgets/common/shimmer_loading.dart';
import 'package:tasks/features/search/presentation/search_provider.dart';
//FOR NEW USER CONTAINER
class FeatureContainerRow extends ConsumerWidget {
  const FeatureContainerRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    MediaQueryUtils.init(context);
    final whatsNewResult = ref.watch(whatsNewFeaturesProvider);

    return whatsNewResult.when(
      loading: () => _buildShimmerFeatures(context, isDark),
      error: (error, stack) => _buildFallbackFeatures(context, isDark),
      data: (features) => features.isEmpty ? _buildFallbackFeatures(context, isDark) : _buildFeaturesFromApi(context, features, isDark),
    );
  }

  Widget _buildFeaturesFromApi(BuildContext context, List<WhatsNewEntity> features, bool isDark) {
    final displayFeatures = features.take(2).toList();
    
    return Row(
      children: [
        if (displayFeatures.isNotEmpty) Expanded(child: _buildFeatureContainer(context, displayFeatures[0].title, displayFeatures[0].imagePath, isDark)),
        if (displayFeatures.length > 1) ...[
          SizedBox(width: MediaQueryUtils.w(12)),
          Expanded(child: _buildFeatureContainer(context, displayFeatures[1].title, displayFeatures[1].imagePath, isDark)),
        ],
        if (displayFeatures.length == 1) Expanded(child: Container()),
      ],
    );
  }

  Widget _buildFallbackFeatures(BuildContext context, bool isDark) {
    return Row(
      children: [
        Expanded(child: _buildFeatureContainer(context, 'Track Spends', 'assets/images/discovery.png', isDark)),
        SizedBox(width: MediaQueryUtils.w(12)),
        Expanded(child: _buildFeatureContainer(context, 'Track Forex', 'assets/images/discovery.png', isDark)),
      ],
    );
  }

  Widget _buildShimmerFeatures(BuildContext context, bool isDark) {
    return Row(
      children: [
        Expanded(child: ShimmerLoading(isLoading: true, child: _buildShimmerContainer(context, isDark))),
        SizedBox(width: MediaQueryUtils.w(12)),
        Expanded(child: ShimmerLoading(isLoading: true, child: _buildShimmerContainer(context, isDark))),
      ],
    );
  }

  Widget _buildShimmerContainer(BuildContext context, bool isDark) {
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(8)),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.grey[300],
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: MediaQueryUtils.w(80), height: MediaQueryUtils.h(80), decoration: BoxDecoration(
            color: isDark ? Colors.grey.shade700 : Colors.grey[400],
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
          )),
          SizedBox(height: MediaQueryUtils.h(8)),
          Container(width: double.infinity, height: MediaQueryUtils.h(16), decoration: BoxDecoration(
            color: isDark ? Colors.grey.shade700 : Colors.grey[400],
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
          )),
        ],
      ),
    );
  }

  Widget _buildFeatureContainer(BuildContext context, String title, String imagePath, bool isDark) {
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(8)),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
        border: Border.all(color: isDark ? Colors.grey.shade700 : Colors.grey.shade300),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: MediaQueryUtils.r(8), offset: Offset(0, MediaQueryUtils.h(4)))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
            child: Image.asset(imagePath, width: MediaQueryUtils.w(80), height: MediaQueryUtils.h(80), fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
              return Container(
                width: MediaQueryUtils.w(80), height: MediaQueryUtils.h(80),
                decoration: BoxDecoration(color: isDark ? Colors.grey.shade800 : Colors.grey[200], borderRadius: BorderRadius.circular(MediaQueryUtils.r(8))),
                child: Icon(Icons.image, size: MediaQueryUtils.w(40), color: isDark ? Colors.grey.shade600 : Colors.grey[400]),
              );
            }),
          ),
          SizedBox(height: MediaQueryUtils.h(8)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(child: Text(title, style: _buildTitleStyle(isDark), maxLines: 2, overflow: TextOverflow.ellipsis)),
            Icon(Icons.north_east, size: MediaQueryUtils.sp(14), color: _getIconColor(isDark)),
          ]),
        ],
      ),
    );
  }

  TextStyle _buildTitleStyle(bool isDark) {
    return GoogleFonts.roboto(fontSize: MediaQueryUtils.sp(14), color: isDark ? Colors.white : Colors.black87, fontWeight: FontWeight.w600);
  }

  Color _getIconColor(bool isDark) => isDark ? Colors.white : Colors.black87;
}