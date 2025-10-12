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
        padding: EdgeInsets.all(baseSize * 1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(baseSize * 3),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
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
              width: baseSize * 25,
              height: baseSize * 25,
              fit: BoxFit.cover,
            ),
          ),
            SizedBox(height: baseSize * 1),
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: baseSize * 3.2,
                    color: const Color.fromARGB(255, 3, 3, 3),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.north_east,
                  size: baseSize * 7,
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