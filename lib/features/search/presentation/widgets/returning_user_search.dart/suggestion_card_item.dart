// File: lib/features/search/presentation/widgets/suggestion_card_item.dart
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
    MediaQueryUtils.init(context);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(MediaQueryUtils.w(8)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: MediaQueryUtils.r(8),
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
              child: Image.asset(
                "assets/images/discovery.png",
                width: MediaQueryUtils.w(80),
                height: MediaQueryUtils.h(80),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: MediaQueryUtils.h(8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: MediaQueryUtils.sp(14),
                    color: const Color.fromARGB(255, 3, 3, 3),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.north_east,
                  size: MediaQueryUtils.sp(16),
                  color: const Color.fromARGB(255, 3, 3, 3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}