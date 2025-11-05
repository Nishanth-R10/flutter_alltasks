// TODO: UNCOMMENT WHEN ADDING RETURNING USER OPTION ITEMS
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchOptionItem extends StatelessWidget {
  final String option;
  final VoidCallback onTap;

  const SearchOptionItem({
    super.key,
    required this.option,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final baseSize = MediaQuery.of(context).size.shortestSide * 0.01;
    
    return Padding(
      padding: EdgeInsets.only(bottom: baseSize * 2),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: baseSize * 4,
            vertical: baseSize * 3,
          ),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: BorderRadius.circular(baseSize * 3),
            border: Border.all(color: isDark ? Colors.grey.shade700 : Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                option,
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
        ),
      ),
    );
  }
}
*/