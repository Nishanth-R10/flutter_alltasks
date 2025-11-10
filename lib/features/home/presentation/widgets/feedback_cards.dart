import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors/default_colors.dart';

class FeedbackCards extends StatelessWidget {
  const FeedbackCards({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        _buildRateAppCard(context, screenWidth, screenHeight),
        SizedBox(height: screenHeight * 0.02),
        _buildQuestionsCard(context, screenWidth, screenHeight),
      ],
    );
  }

  Widget _buildRateAppCard(BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: DefaultColors.yellowBG,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Love to hear your feedback.", // Hardcoded string
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w400,
                    color: DefaultColors.black.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  "Rate the App!", // Hardcoded string
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w700,
                    color: DefaultColors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.01),
                      child: Icon(
                        Icons.star,
                        color: DefaultColors.yellow14,
                        size: screenWidth * 0.08,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Image.asset(
            'assets/images/recommendation.gif',
            width: screenWidth * 0.15,
            height: screenWidth * 0.20,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionsCard(BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: DefaultColors.grayF4,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Have any Questions?", // Hardcoded string
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w400,
                    color: DefaultColors.black.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  "Rashid is here to help you", // Hardcoded string
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w700,
                    color: DefaultColors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Get Help", // Hardcoded string
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w600,
                          color: DefaultColors.blueLightBase,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Icon(
                        Icons.north_east,
                        color: DefaultColors.blueLightBase,
                        size: screenWidth * 0.04,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Image.asset(
            'assets/images/robot.gif',
            width: screenWidth * 0.15,
            height: screenWidth * 0.20,
          ),
        ],
      ),
    );
  }
}