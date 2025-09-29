// File: lib/features/search/presentation/pages/newuser_searchscreen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tasks/core/sizing_utils.dart';
import '../widgets/search_bar.dart';

import '../../../../core/constants/app_constants.dart';

class NewUserSearchScreen extends ConsumerWidget {
  const NewUserSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizingUtils.dynamicWidth(0.04, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(
                controller: searchController,
                onCancel: () => Navigator.pop(context),
                onClear: () => searchController.clear(),
              ),
              SizedBox(height: SizingUtils.dynamicHeight(0.02, context)),

              Text(
                "Search for",
                style: GoogleFonts.poppins(
                  fontSize: SizingUtils.dynamicFont(0.02, context),
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: SizingUtils.dynamicHeight(0.015, context)),

              Wrap(
                spacing: SizingUtils.dynamicWidth(0.03, context),
                runSpacing: SizingUtils.dynamicHeight(0.015, context),
                children: AppConstants.searchOptions.map((option) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizingUtils.dynamicWidth(0.04, context),
                      vertical: SizingUtils.dynamicHeight(0.012, context),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(SizingUtils.dynamicHeight(0.03, context)),
                      border: Border.all(
                        color: AppConstants.kBorderBlue,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          option,
                          style: GoogleFonts.poppins(
                            fontSize: SizingUtils.dynamicFont(0.018, context),
                            fontWeight: FontWeight.w500,
                            color: AppConstants.kBorderBlue,
                          ),
                        ),
                        SizedBox(width: SizingUtils.dynamicWidth(0.01, context)),
                        Icon(
                          Icons.north_east,
                          size: SizingUtils.dynamicFont(0.02, context),
                          color: AppConstants.kBorderBlue,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}