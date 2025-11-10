import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_colors/default_colors.dart';

class QuickActionsHeader extends StatelessWidget {
  const QuickActionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return SizedBox(
      width: screenWidth * 0.9,
      height: screenWidth * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Quick Actions", // Hardcoded string
            style: GoogleFonts.dmSans(
              fontSize: screenWidth * 0.048,
              fontWeight: FontWeight.w600,
              color: DefaultColors.black,
              letterSpacing: 0,
              height: 1.2,
            ),
          ),
          _buildCustomizeButton(context),
        ],
      ),
    );
  }

  Widget _buildCustomizeButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: screenWidth * 0.015,
      ),
      child: Row(
        children: [
          Text(
            "Customize", // Hardcoded string
            style: TextStyle(
              fontFamily: 'Diodrum Arabic',
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.03,
              color: DefaultColors.blueLightBase,
              height: 1.2,
              letterSpacing: 0,
            ),
          ),
          SizedBox(width: screenWidth * 0.01),
          Icon(
            Icons.north_east,
            size: screenWidth * 0.03,
            color: DefaultColors.blueLightBase,
          ),
        ],
      ),
    );
  }
}