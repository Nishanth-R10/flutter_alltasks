// File: lib/features/search/presentation/widgets/suggestion_card.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/sizing_utils.dart';



class SuggestionCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SuggestionCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final baseSize = screenWidth * 0.01;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(baseSize * 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(baseSize * 12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizingUtils.dynamicHeight(0.1, context),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(baseSize * 8),
                ),
              ),
              SizedBox(height: baseSize * 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: baseSize * 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.north_east,
                    size: baseSize * 16,
                    color: Colors.blue,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}