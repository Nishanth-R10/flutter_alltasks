<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/profile/presentation/app_size.dart';

class BigCard extends StatelessWidget {
  final String title;
  final String imageAsset;
  final double fontScale;

  const BigCard({
    super.key,
    required this.title,
    required this.imageAsset,
    this.fontScale = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.s16),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.s16),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(AppSizes.s12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                child: Image.asset(
                  imageAsset,
                  width: AppSizes.s80,
                  height: AppSizes.s80,
                  fit: BoxFit.cover,
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        color: Color(0xFF4197CB),
                        fontSize: fontScale,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(width: AppSizes.s4),
                  Icon(
                    Icons.north_east,
                    size: 14,
                    color: Color(0xFF4197CB),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
=======
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/profile/presentation/app_size.dart';

class BigCard extends StatelessWidget {
  final String title;
  final String imageAsset;
  final double fontScale;

  const BigCard({
    super.key,
    required this.title,
    required this.imageAsset,
    this.fontScale = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.s16),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.s16),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(AppSizes.s12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with rounded corners - no background circle
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                child: Image.asset(
                  imageAsset,
                  width: AppSizes.s80,
                  height: AppSizes.s80,
                  fit: BoxFit.cover,
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        color: Color(0xFF4197CB),
                        fontSize: fontScale,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(width: AppSizes.s4),
                  Icon(
                    Icons.north_east,
                    size: 14,
                    color: Color(0xFF4197CB),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}