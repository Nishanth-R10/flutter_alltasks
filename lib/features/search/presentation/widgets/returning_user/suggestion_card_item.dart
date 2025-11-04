import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class SuggestionCardItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SuggestionCardItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    MediaQueryUtils.init(context);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(MediaQueryUtils.w(8)),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
          border: Border.all(color: isDark ? Colors.grey.shade700 : Colors.grey.shade300),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: MediaQueryUtils.r(8), offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
              child: Image.asset("assets/images/discovery.png", width: MediaQueryUtils.w(80), height: MediaQueryUtils.h(80), fit: BoxFit.cover),
            ),
            SizedBox(height: MediaQueryUtils.h(8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: _buildTextStyle(isDark)),
                Icon(Icons.north_east, size: MediaQueryUtils.sp(16), color: _getIconColor(isDark)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _buildTextStyle(bool isDark) {
    return GoogleFonts.poppins(
      fontSize: MediaQueryUtils.sp(14),
      color: isDark ? Colors.white : const Color.fromARGB(255, 3, 3, 3),
      fontWeight: FontWeight.w500,
    );
  }

  Color _getIconColor(bool isDark) {
    return isDark ? Colors.white : const Color.fromARGB(255, 3, 3, 3);
  }
}