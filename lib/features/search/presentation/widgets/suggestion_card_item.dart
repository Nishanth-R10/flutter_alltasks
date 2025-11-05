// TODO: UNCOMMENT WHEN ADDING RETURNING USER SUGGESTION CARDS
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final baseSize = MediaQuery.of(context).size.shortestSide * 0.01;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(baseSize * 2),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(baseSize * 3),
          border: Border.all(color: isDark ? Colors.grey.shade700 : Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: baseSize * 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(baseSize * 2),
              child: Image.asset(
                "assets/images/discovery.png",
                width: baseSize * 20,
                height: baseSize * 20,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: baseSize * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: baseSize * 3.5,
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.north_east,
                  size: baseSize * 4,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/