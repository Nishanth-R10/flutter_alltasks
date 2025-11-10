// search_chip_item.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors/default_colors.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseSize = MediaQuery.of(context).size.shortestSide * 0.01;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: baseSize * 4,
        vertical: baseSize * 2,
      ),
      decoration: BoxDecoration(
        color: isDark ? DefaultColors.black24 : DefaultColors.white,
        borderRadius: BorderRadius.circular(baseSize * 6),
        border: Border.all(
          color: DefaultColors.blue9D,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: baseSize * 4,
            color: DefaultColors.blue9D,
          ),
          SizedBox(width: baseSize * 2),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3,
              fontWeight: FontWeight.w500,
              color: DefaultColors.blue9D,
            ),
          ),
        ],
      ),
    );
  }
}