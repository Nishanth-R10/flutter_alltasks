import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_colors/default_colors.dart';

class RewardsHeader extends StatelessWidget {
  const RewardsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return SizedBox(
      width: screenWidth * 0.9,
      height: screenWidth * 0.08,
      child: Text(
        "Rewards", // Hardcoded string
        style: GoogleFonts.dmSans(
          fontSize: screenWidth * 0.048,
          fontWeight: FontWeight.w600,
          color: DefaultColors.black,
          letterSpacing: 0,
          height: 1.2,
        ),
      ),
    );
  }
}