import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_colors/default_colors.dart';

class RewardsHeader extends StatelessWidget {
  const RewardsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return SizedBox(
      width: screenWidth * 0.9,
      height: 32,
      child: const Text(
        "Rewards",
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: DefaultColors.black,
        ),
      ),
    );
  }
}