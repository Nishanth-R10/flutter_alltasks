import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors/default_colors.dart';
class RewardsCard extends StatelessWidget {
  const RewardsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DefaultColors.whiteF3,
        borderRadius: BorderRadius.circular(16),
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
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '0 Reward Points earned',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
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