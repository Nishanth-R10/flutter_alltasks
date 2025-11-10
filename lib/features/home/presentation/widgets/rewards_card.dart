import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_colors/default_colors.dart';

class RewardsCard extends StatelessWidget {
  
const RewardsCard({super.key}); 

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: DefaultColors.whiteF3,
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: screenWidth * 0.040,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.card_giftcard,
            size: screenWidth * 0.06,
            color: DefaultColors.blueLightBase,
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Text(
              '0 Reward Points earned', // Hardcoded 
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * 0.035,
                color: DefaultColors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.north_east,
            size: screenWidth * 0.045,
            color: DefaultColors.blueLightBase,
          ),
        ],
      ),
    );
  }
}