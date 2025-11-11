import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors/default_colors.dart';
class QuickActionsHeader extends StatelessWidget {
  const QuickActionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return SizedBox(
      width: screenWidth * 0.9,
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Quick Actions",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: DefaultColors.black,
            ),
          ),
          _buildCustomizeButton(context),
        ],
      ),
    );
  }

  Widget _buildCustomizeButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          Text(
            "Customize",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: DefaultColors.blueLightBase,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.north_east,
            size: 16,
            color: DefaultColors.blueLightBase,
          ),
        ],
      ),
    );
  }
}