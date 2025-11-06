import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/profile/presentation/app_size.dart';
import 'package:shimmer/shimmer.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final bool compact;
  final bool bigCard;
  final bool verticalLayout;
  final IconData? icon;
  final double fontScale;
  final bool showCircle;
  final bool isLoading;

  const SettingCard({
    super.key,
    required this.title,
    this.compact = false,
    this.bigCard = false,
    this.verticalLayout = false,
    this.icon,
    this.fontScale = 14,
    this.showCircle = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final horizontalPadding = AppSizes.s16;
    final verticalPadding = bigCard ? AppSizes.s16 : AppSizes.s16;

    if (isLoading) {
      return _buildShimmerSettingCard(isDark, horizontalPadding, verticalPadding);
    }

    return Material(
      color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.s16),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.s16),
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showCircle)
                Container(
                  width: AppSizes.s24, 
                  height: AppSizes.s24, 
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF2A2A2A) : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDark ? Colors.grey.shade600 : Colors.grey.shade300, 
                      width: 1.5
                    ),
                  ),
                ),
              if (showCircle) const SizedBox(width: AppSizes.s16),
              if (icon != null) Icon(
                icon, 
                size: AppSizes.s24, 
                color: isDark ? Colors.white : Colors.black87
              ),
              if (icon != null) const SizedBox(width: AppSizes.s8),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: fontScale,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4197CB),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.north_east, size: 16, color: const Color(0xFF4197CB)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerSettingCard(bool isDark, double horizontalPadding, double verticalPadding) {
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Material(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.s16),
        elevation: 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: AppSizes.s24, 
                height: AppSizes.s24, 
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[700] : Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppSizes.s16),
              Expanded(
                child: Container(
                  height: fontScale,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[700] : Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[700] : Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}