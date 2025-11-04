import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_constants.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class SearchChipItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const SearchChipItem({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    MediaQueryUtils.init(context);
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQueryUtils.w(16), vertical: MediaQueryUtils.h(8)),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(25)),
        border: Border.all(color: AppConstants.kBorderBlue, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: MediaQueryUtils.sp(16), color: AppConstants.kBorderBlue),
          SizedBox(width: MediaQueryUtils.w(8)),
          Text(title, style: _buildTextStyle()),
        ],
      ),
    );
  }

  TextStyle _buildTextStyle() {
    return GoogleFonts.poppins(
      fontSize: MediaQueryUtils.sp(12),
      fontWeight: FontWeight.w500,
      color: AppConstants.kBorderBlue,
    );
  }
}