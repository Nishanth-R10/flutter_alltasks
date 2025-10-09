import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/core/constants/app_constants.dart';
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
    searchController.notifyListeners();
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
}