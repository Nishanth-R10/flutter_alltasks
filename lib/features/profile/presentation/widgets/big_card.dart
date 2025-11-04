import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/profile/presentation/app_size.dart';
import 'package:shimmer/shimmer.dart';

class BigCard extends StatelessWidget {
  final String title;
  final String imageAsset;
  final double fontScale;
  final bool isLoading;

  const BigCard({
    super.key,
    required this.title,
    required this.imageAsset,
    this.fontScale = 12,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (isLoading) {
      return _buildShimmerBigCard(isDark);
    }

    return Material(
      color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.s16),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.s16),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(AppSizes.s12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with rounded corners - no background circle
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                child: Image.asset(
                  imageAsset,
                  width: AppSizes.s80,
                  height: AppSizes.s80,
                  fit: BoxFit.cover,
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF4197CB),
                        fontSize: fontScale,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(width: AppSizes.s4),
                  Icon(
                    Icons.north_east,
                    size: 14,
                    color: const Color(0xFF4197CB),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerBigCard(bool isDark) {
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Material(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.s16),
        elevation: 1,
        child: Container(
          padding: const EdgeInsets.all(AppSizes.s12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: AppSizes.s80,
                height: AppSizes.s80,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[700] : Colors.white,
                  borderRadius: BorderRadius.circular(AppSizes.s8),
                ),
              ),
              const SizedBox(height: AppSizes.s8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: fontScale,
                      decoration: BoxDecoration(
                        color: isDark ? Colors.grey[700] : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSizes.s4),
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[700] : Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}