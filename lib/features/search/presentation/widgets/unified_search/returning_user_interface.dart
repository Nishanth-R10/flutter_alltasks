<<<<<<< HEAD
// lib/features/search/presentation/widgets/unified_search/returning_user_interface.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_constants.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/search/presentation/widgets/returning_user_search.dart/search_option_item.dart';
import 'package:tasks/features/search/presentation/widgets/returning_user_search.dart/suggestion_card_item.dart';

class ReturningUserInterface extends StatelessWidget {
  final TextEditingController searchController;

  const ReturningUserInterface({
    super.key,
    required this.searchController,
  });

  void _onSearchChanged(String query) {
    
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DefaultString.instance.searchFor,
            style: GoogleFonts.poppins(
              fontSize: MediaQueryUtils.sp(16),
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 7, 7, 7),
            ),
          ),
          SizedBox(height: MediaQueryUtils.h(8)),

          Column(
            children: AppConstants.searchOptions.map((option) {
              return SearchOptionItem(
                option: option,
                onTap: () => _onSearchChanged(option),
              );
            }).toList(),
          ),
          SizedBox(height: MediaQueryUtils.h(12)),

          Text(
            DefaultString.instance.suggestions,
            style: GoogleFonts.poppins(
              fontSize: MediaQueryUtils.sp(16),
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 7, 7, 7),
            ),
          ),
          SizedBox(height: MediaQueryUtils.h(8)),

          Row(
            children: [
              Expanded(
                child: SuggestionCardItem(
                  title: DefaultString.instance.mobileRecharge,
                  onTap: () => _onSearchChanged(DefaultString.instance.mobileRecharge),
                ),
              ),
              SizedBox(width: MediaQueryUtils.w(12)),
              Expanded(
                child: SuggestionCardItem(
                  title: DefaultString.instance.offersSearch,
                  onTap: () => _onSearchChanged(DefaultString.instance.offersSearch),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
=======
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_constants.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/features/search/presentation/widgets/returning_user_search.dart/search_option_item.dart';
import 'package:tasks/features/search/presentation/widgets/returning_user_search.dart/suggestion_card_item.dart';

class ReturningUserInterface extends StatelessWidget {
  final double baseSize;
  final TextEditingController searchController;

  const ReturningUserInterface({
    super.key,
    required this.baseSize,
    required this.searchController,
  });

  void _onSearchChanged(String query) {
    searchController.text = query;
    // Remove this line: searchController.notifyListeners(); // ❌ WRONG
    // TextEditingController doesn't have notifyListeners
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DefaultString.instance.searchFor,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4.2,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 7, 7, 7),
            ),
          ),
          SizedBox(height: baseSize * 2),

          Column(
            children: AppConstants.searchOptions.map((option) {
              return SearchOptionItem(
                option: option,
                onTap: () => _onSearchChanged(option),
                baseSize: baseSize,
              );
            }).toList(),
          ),
          SizedBox(height: baseSize * 3),

          Text(
            DefaultString.instance.suggestions,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4.2,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 7, 7, 7),
            ),
          ),
          SizedBox(height: baseSize * 2),

          Row(
            children: [
              Expanded(
                child: SuggestionCardItem(
                  title: DefaultString.instance.mobileRecharge,
                  onTap: () => _onSearchChanged(DefaultString.instance.mobileRecharge),
                  baseSize: baseSize,
                ),
              ),
              SizedBox(width: baseSize * 3),
              Expanded(
                child: SuggestionCardItem(
                  title: DefaultString.instance.offersSearch,
                  onTap: () => _onSearchChanged(DefaultString.instance.offersSearch),
                  baseSize: baseSize,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}