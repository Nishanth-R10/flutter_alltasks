// File: lib/features/search/presentation/widgets/suggestion_card_item.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tasks/core/sizing_utils.dart';

import '../../../../core/constants/app_constants.dart';

class SuggestionCardItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SuggestionCardItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: SizingUtils.dynamicWidth(0.03, context)),
        child: Container(
          padding: EdgeInsets.all(SizingUtils.dynamicWidth(0.04, context)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              SizingUtils.dynamicHeight(0.025, context),
            ),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  SizingUtils.dynamicHeight(0.012, context),
                ),
                child: Image.asset(
                  'assets/images/discovery.png',
                  height: SizingUtils.dynamicHeight(0.07, context),
                  width: SizingUtils.dynamicWidth(0.16, context),
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,
                ),
              ),
              SizedBox(height: SizingUtils.dynamicHeight(0.015, context)),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Discovery Feature",
                        style: GoogleFonts.poppins(
                          fontSize: SizingUtils.dynamicFont(0.015, context),
                          color: AppConstants.kBorderBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: SizingUtils.dynamicWidth(0.02, context)),
                  Icon(
                    Icons.north_east,
                    size: SizingUtils.dynamicFont(0.018, context),
                    color: AppConstants.kBorderBlue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}