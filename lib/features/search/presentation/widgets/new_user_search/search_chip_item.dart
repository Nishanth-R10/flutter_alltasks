<<<<<<< HEAD
// File: lib/features/search/presentation/widgets/search_chip_item.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_constants.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class SearchChipItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const SearchChipItem({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQueryUtils.w(16),
        vertical: MediaQueryUtils.h(8),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(25)),
        border: Border.all(
          color: AppConstants.kBorderBlue,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: MediaQueryUtils.sp(16),
            color: AppConstants.kBorderBlue,
          ),
          SizedBox(width: MediaQueryUtils.w(8)),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: MediaQueryUtils.sp(12),
              fontWeight: FontWeight.w500,
              color: AppConstants.kBorderBlue,
            ),
          ),
        ],
      ),
    );
  }
=======
// File: lib/features/search/presentation/widgets/search_chip_item.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_constants.dart';

class SearchChipItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final double baseSize;

  const SearchChipItem({
    super.key,
    required this.title,
    required this.icon,
    required this.baseSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: baseSize * 4,
        vertical: baseSize * 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(baseSize * 25),
        border: Border.all(
          color: AppConstants.kBorderBlue,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: baseSize * 4.5,
            color: AppConstants.kBorderBlue,
          ),
          SizedBox(width: baseSize * 2),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3.2,
              fontWeight: FontWeight.w500,
              color: AppConstants.kBorderBlue,
            ),
          ),
        ],
      ),
    );
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}