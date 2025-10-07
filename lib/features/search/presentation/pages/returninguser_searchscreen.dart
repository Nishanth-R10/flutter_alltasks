// File: lib/features/search/presentation/pages/returninguser_searchscreen.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/core/constants/app_constants.dart';

import '../widgets/common/search_bar.dart';
import '../widgets/returning_user_search.dart/search_option_item.dart';
import '../widgets/returning_user_search.dart/suggestion_card_item.dart';

@RoutePage()
class ReturningUserSearchScreen extends ConsumerWidget {
  const ReturningUserSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    final Size screenSize = MediaQuery.of(context).size;
    final double baseSize = screenSize.width * 0.01;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(baseSize * 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(
                controller: searchController,
                onCancel: () => Navigator.pop(context),
                onClear: () => searchController.clear(),
                baseSize: baseSize,
              ),
              SizedBox(height: baseSize * 3),

              Text(
                "Search for",
                style: GoogleFonts.poppins(
                  fontSize: baseSize * 4.2, // Reduced font size
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 7, 7, 7),
                ),
              ),
              SizedBox(height: baseSize * 2),

              Column(
                children: AppConstants.searchOptions.map((option) {
                  return SearchOptionItem(
                    option: option,
                    onTap: () {},
                    baseSize: baseSize,
                  );
                }).toList(),
              ),
              SizedBox(height: baseSize * 3),

              Text(
                "Suggestions",
                style: GoogleFonts.poppins(
                  fontSize: baseSize * 4.2,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 7, 7, 7),
                ),
              ),
              SizedBox(height: baseSize * 2),

              // Two cards with different texts
              Row(
                children: [
                  Expanded(
                    child: SuggestionCardItem(
                      title: "Mobile Recharge",
                      onTap: () {},
                      baseSize: baseSize,
                    ),
                  ),
                  SizedBox(width: baseSize * 3),
                  Expanded(
                    child: SuggestionCardItem(
                      title: "Offers",
                      onTap: () {},
                      baseSize: baseSize,
                    ),
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