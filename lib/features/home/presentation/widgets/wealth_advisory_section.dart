import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_colors/default_colors.dart';

class WealthAdvisorySection extends StatelessWidget {
  const WealthAdvisorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Wealth Advisory", // Hardcoded string
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w700,
                color: DefaultColors.black,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    "Learn More", // Hardcoded string
                    style: TextStyle(
                      color: DefaultColors.blueLightBase,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Icon(
                    Icons.north_east,
                    size: screenWidth * 0.04,
                    color: DefaultColors.blueLightBase,
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: screenHeight * 0.02),

        // Two cards in a row
        Row(
          children: [
            _buildAdvisoryCard(context,
              icon: Icons.work_outline,
              title: "Portfolio\nManagement", // Hardcoded string
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            SizedBox(width: screenWidth * 0.04),
            _buildAdvisoryCard(context,
              icon: Icons.savings_outlined,
              title: "Mutual\nFunds", // Hardcoded string
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdvisoryCard(BuildContext context,
      {required IconData icon, required String title, required double screenWidth, required double screenHeight}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: DefaultColors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top gray section (icon aligned to left)
            Container(
              height: screenHeight * 0.08,
              decoration: BoxDecoration(
                color: DefaultColors.grayF4,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.04),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    icon,
                    color: DefaultColors.blueLightBase,
                    size: screenWidth * 0.08,
                  ),
                ),
              ),
            ),

            // Bottom text section
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.015,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w600,
                        color: DefaultColors.black,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.north_east,
                    color: DefaultColors.black.withOpacity(0.7),
                    size: screenWidth * 0.04,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}