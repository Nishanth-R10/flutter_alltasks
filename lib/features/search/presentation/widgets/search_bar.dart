// File: lib/features/search/presentation/widgets/search_bar.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tasks/core/sizing_utils.dart';

import '../../../../core/constants/app_constants.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onCancel;
  final VoidCallback onClear;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: SizingUtils.dynamicHeight(0.055, context),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: AppConstants.kBorderBlue,
                  ),
                ),
                hintStyle: GoogleFonts.poppins(
                  fontSize: SizingUtils.dynamicFont(0.01, context),
                  color: AppConstants.kBorderBlue,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: SizingUtils.dynamicFont(0.02, context),
                  color: Colors.grey.shade600,
                ),
                suffixIcon: Container(
                  margin: EdgeInsets.all(
                    SizingUtils.dynamicWidth(0.02, context),
                  ),
                  padding: EdgeInsets.all(
                    SizingUtils.dynamicWidth(0.0010, context),
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppConstants.kGreyIcon,
                  ),
                  child: Icon(
                    Icons.close,
                    size: SizingUtils.dynamicFont(0.018, context),
                    color: Colors.white,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: SizingUtils.dynamicHeight(0.012, context),
                  horizontal: SizingUtils.dynamicWidth(0.02, context),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    SizingUtils.dynamicHeight(0.03, context),
                  ),
                  borderSide: const BorderSide(
                    color: AppConstants.kBorderBlue,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: SizingUtils.dynamicWidth(0.01, context)),
        TextButton(
          onPressed: onCancel,
          child: Text(
            "Cancel",
            style: GoogleFonts.poppins(
              color: AppConstants.kBorderBlue,
              fontSize: SizingUtils.dynamicFont(0.018, context),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}