import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final baseSize = MediaQuery.of(context).size.shortestSide * 0.01;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: baseSize * 4,
        vertical: baseSize * 2,
      ),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(baseSize * 6),
        border: Border.all(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: baseSize * 4,
            color: Colors.blue,
          ),
          SizedBox(width: baseSize * 2),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}