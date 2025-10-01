import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tasks/core/utils/sizing_utils.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_option_item.dart';
import '../widgets/suggestion_card_item.dart';

import '../../../../core/constants/app_constants.dart';

@RoutePage()
class ReturningUserSearchScreen extends ConsumerWidget {
   ReturningUserSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Returning User Search'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizingUtils.dynamicWidth(0.04, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(
                controller: searchController,
                onCancel: () => context.pop(),
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
                  fontWeight: FontWeight.w600,
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