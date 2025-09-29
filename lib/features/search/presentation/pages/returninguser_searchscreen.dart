// File: lib/features/search/presentation/pages/returninguser_searchscreen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tasks/core/sizing_utils.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_option_item.dart';
import '../widgets/suggestion_card_item.dart';

import '../../../../core/constants/app_constants.dart';

class ReturningUserSearchScreen extends ConsumerWidget {
  const ReturningUserSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white, // Added white background color
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
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: SizingUtils.dynamicHeight(0.015, context)),

              Column(
                children: AppConstants.searchOptions.map((option) {
                  return SearchOptionItem(
                    option: option,
                    onTap: () {},
                  );
                }).toList(),
              ),
              SizedBox(height: SizingUtils.dynamicHeight(0.02, context)),

              Text(
                "Suggestions",
                style: GoogleFonts.poppins(
                  fontSize: SizingUtils.dynamicFont(0.02, context),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: SizingUtils.dynamicHeight(0.015, context)),

              Row(
                children: List.generate(2, (index) {
                  return SuggestionCardItem(
                    title: "Discovery Feature",
                    onTap: () {},
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}