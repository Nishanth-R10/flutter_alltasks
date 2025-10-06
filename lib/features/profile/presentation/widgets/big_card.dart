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
              
              Container(
                width: AppSizes.s40, 
                height: AppSizes.s64, 
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  imageAsset,
                  width: AppSizes.s48, 
                  height: AppSizes.s48, 
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: fontScale,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 4, 0, 255),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(width: AppSizes.s4),
                  Icon(Icons.north_east, size: 14, color: const Color.fromARGB(255, 4, 0, 255)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}