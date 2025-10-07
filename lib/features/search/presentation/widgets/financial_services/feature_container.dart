// File: lib/features/search/presentation/widgets/feature_container_row.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/core/constants/app_constants.dart';

class FeatureContainerRow extends StatelessWidget {
  final double baseSize;

  const FeatureContainerRow({
    super.key,
    required this.baseSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildFeatureContainer(
            "Track Spends",
            "assets/images/track_spends.png",
            baseSize,
          ),
        ),
        SizedBox(width: baseSize * 3),
        Expanded(
          child: _buildFeatureContainer(
            "Track Forex",
            "assets/images/track_forex.png",
            baseSize,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureContainer(String title, String imagePath, double baseSize) {
    return Container(
      padding: EdgeInsets.all(baseSize * 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(baseSize * 3),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with exact size: 88x68
          Container(
            width: 88, // Exact width
            height: 68, // Exact height
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: baseSize * 2),
          
          // Text and arrow icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: baseSize * 3.8,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.north_east,
                size: baseSize * 4,
                color: const Color.fromARGB(255, 17, 17, 17),
              ),
            ],
          ),
        ],
      ),
    );
  }
}