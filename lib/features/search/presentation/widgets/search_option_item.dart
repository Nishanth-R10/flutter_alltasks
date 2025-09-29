// File: lib/features/search/presentation/widgets/search_option_item.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tasks/core/sizing_utils.dart';

import '../../../../core/constants/app_constants.dart';

class SearchOptionItem extends StatelessWidget {
  final String option;
  final VoidCallback onTap;

  const SearchOptionItem({
    super.key,
    required this.option,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizingUtils.dynamicHeight(0.015, context)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizingUtils.dynamicWidth(0.04, context),
          vertical: SizingUtils.dynamicHeight(0.018, context),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            SizingUtils.dynamicHeight(0.02, context),
          ),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(  
              option,
              style: GoogleFonts.poppins(
                fontSize: SizingUtils.dynamicFont(0.018, context),
                color: AppConstants.kBorderBlue,
              ),
            ),
            Icon(
              Icons.north_east,
              size: SizingUtils.dynamicFont(0.02, context),
              color: AppConstants.kBorderBlue,
            ),
          ],
        ),
      ),
    );
  }
}