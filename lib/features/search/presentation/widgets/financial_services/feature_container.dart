import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';

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
            DefaultString.instance.trackSpends,
            "assets/images/discovery.png",
            baseSize,
          ),
        ),
        SizedBox(width: baseSize * 3),
        Expanded(
          child: _buildFeatureContainer(
            DefaultString.instance.trackForex,
            "assets/images/discovery.png",
            baseSize,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureContainer(String title, String imagePath, double baseSize) {
    return Container(
      padding: EdgeInsets.all(baseSize * 1),
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
          // Image with rounded corners - no grey background
          ClipRRect(
            borderRadius: BorderRadius.circular(baseSize * 2),
            child: Image.asset(
              "assets/images/discovery.png",
              width: baseSize * 25,
              height: baseSize * 25,
              fit: BoxFit.cover,
            ),
          ),
          
          SizedBox(height: baseSize * 2),
          
          // Title and arrow at the bottom
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: baseSize * 3.5,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.north_east,
                size: baseSize * 3.5,
                color: Colors.black87,
              ),
            ],
          ),
        ],
      ),
    );
  }
}