// File: lib/features/search/presentation/widgets/suggestion_card_item.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/core/constants/app_constants.dart';

class SuggestionCardItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double baseSize;

  const SuggestionCardItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.baseSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(baseSize * 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(baseSize * 3),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image container
            Container(
              height: baseSize * 12,
              width: double.infinity,
              decoration: BoxDecoration(
              //  color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(baseSize * 1.5),
              ),
              child: Image.asset(
                'assets/images/discovery.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: baseSize * 2),
            
            // Text with arrow icon at the end
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: baseSize * 3.2, // Reduced font size
                    color: const Color.fromARGB(255, 3, 3, 3),
                    fontWeight: FontWeight.w500, // Reduced weight
                  ),
                ),
                Icon(
                  Icons.north_east,
                  size: baseSize * 3.5, // Reduced icon size
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