// TODO: UNCOMMENT WHEN ADDING RETURNING USER INTERFACE
/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'search_option_item.dart';
import 'suggestion_card_item.dart';

class ReturningUserInterface extends StatelessWidget {
  final TextEditingController searchController;

  const ReturningUserInterface({
    super.key,
    required this.searchController,
  });

  void _onSearchChanged(String query) {
    searchController.text = query;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final baseSize = MediaQuery.of(context).size.shortestSide * 0.01;
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Search for financial services",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: baseSize * 2),

          Column(
            children: [
              "Home Finance", "Instant Finance", "Car Finance", "Personal Finance",
              "Business Loans", "Investment Plans", "Loan Services", "Wealth Management"
            ].map((option) {
              return SearchOptionItem(
                option: option,
                onTap: () => _onSearchChanged(option),
              );
            }).toList(),
          ),
          SizedBox(height: baseSize * 3),

          Text(
            "Suggestions",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: baseSize * 2),

          Row(
            children: [
              Expanded(
                child: SuggestionCardItem(
                  title: "Mobile Recharge",
                  onTap: () => _onSearchChanged("Mobile Recharge"),
                ),
              ),
              SizedBox(width: baseSize * 3),
              Expanded(
                child: SuggestionCardItem(
                  title: "Offers",
                  onTap: () => _onSearchChanged("Offers"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/