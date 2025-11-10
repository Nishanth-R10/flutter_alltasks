import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_colors/default_colors.dart';

class ReferEarnContent extends StatelessWidget {
  const ReferEarnContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Stack(
      clipBehavior: Clip.none, 
      children: [
        _buildContentCard(context, screenWidth, screenHeight),
        _buildGiftImage(screenWidth, screenHeight),
      ],
    );
  }

  Widget _buildContentCard(BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.025),
      decoration: BoxDecoration(
        color: DefaultColors.dashboardLightBlue,
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03), 
            blurRadius: screenWidth * 0.02
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth * 0.6,
            child: _buildDescription(screenWidth),
          ),
          SizedBox(height: screenHeight * 0.015),
          _buildReferralCodeSection(screenWidth),
        ],
      ),
    );
  }

  Widget _buildDescription(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.8,
      child: Column(
        children: [
          Text(  
            "Help your friends to grow with their wealth", // Hardcoded string
            style: TextStyle(
              fontFamily: 'Diodrum Arabic',
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.040,
              height: 1.6,
              letterSpacing: 0,
              color: DefaultColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReferralCodeSection(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildReferralCode(screenWidth),
      ],
    );
  }

  Widget _buildReferralCode(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(
            "A successful referral earns you 50 points!", // Hardcoded string
            style: TextStyle(
              fontFamily: 'Diodrum Arabic',
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.04,
              height: 1.2,
              letterSpacing: 0,
              color: DefaultColors.black,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              '',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
                color: DefaultColors.black,
              ),
            ),
          ],
        ),  
      ],
    );
  }

  Widget _buildGiftImage(double screenWidth, double screenHeight) {
    return Positioned(
      top: -screenHeight * 0.08,  
      right: -screenWidth * 0.1, 
      child: Image.asset(
        'assets/images/gift.png',
        width: screenWidth * 0.6, 
        height: screenHeight * 0.18, 
      ),
    );
  }
}