import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors/default_colors.dart';
class OffersHeader extends StatelessWidget {
  const OffersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      width: screenWidth * 0.9,
      height: 24,
      child: const Text(
        "Offers",
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: DefaultColors.black,
        ),
      ),
    );
  }
}