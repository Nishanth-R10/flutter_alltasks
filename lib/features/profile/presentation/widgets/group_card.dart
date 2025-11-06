import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/profile/presentation/app_size.dart';
import 'package:shimmer/shimmer.dart';

class GroupCard extends StatelessWidget {
  final List<String> titles;
  final double fontScale;
  final bool isLoading;
  const GroupCard({
    super.key, 
    required this.titles, 
    required this.fontScale,
    this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final borderRadius = AppSizes.s16;
    
    if (isLoading) {
      return _buildShimmerGroupCard(isDark, borderRadius);
    }
    
    return Material(
      color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      borderRadius: BorderRadius.circular(borderRadius),
      elevation: 0.5,
      child: Column(
        children: List.generate(titles.length, (index) {
          final isLast = index == titles.length - 1;
          return InkWell(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(index == 0 ? borderRadius : 0),
              topRight: Radius.circular(index == 0 ? borderRadius : 0),
              bottomLeft: Radius.circular(isLast ? borderRadius : 0),
              bottomRight: Radius.circular(isLast ? borderRadius : 0),
            ),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.s16,
                vertical: AppSizes.s16,
              ),
              child: Row(
                children: [
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
                  const SizedBox(width: AppSizes.s16),
                  Expanded(
                    child: Text(
                      titles[index],
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
          );
        }),
      ),
    );
  }

  Widget _buildShimmerGroupCard(bool isDark, double borderRadius) {
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Material(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        elevation: 0.5,
        child: Column(
          children: List.generate(3, (index) {
            final isLast = index == 2;
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.s16,
                vertical: AppSizes.s16,
              ),
              child: Row(
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
            );
          }),
        ),
      ),
    );
  }
}