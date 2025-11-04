import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_constants.dart';

class FinancialServicesResults extends StatelessWidget {
  final List<String> searchResults;
  final TextEditingController searchController;
  final double baseSize;

  const FinancialServicesResults({
    super.key,
    required this.searchResults,
    required this.searchController,
    required this.baseSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    if (searchController.text.isEmpty) {
      return _buildEmptyState(context, isDark);
    }

    if (searchResults.isEmpty) {
      return _buildNoResults(context, isDark);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DefaultString.instance.searchResults,
          style: GoogleFonts.poppins(
            fontSize: baseSize * 4.2,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black, // Your exact color
          ),
        ),
        SizedBox(height: baseSize * 2),
        Expanded(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return _buildSearchResultItem(context, searchResults[index], isDark);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResultItem(BuildContext context, String service, bool isDark) {
    final searchQuery = searchController.text.toLowerCase();
    
    return Container(
      margin: EdgeInsets.only(bottom: baseSize * 2),
      padding: EdgeInsets.all(baseSize * 3),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white, // Your white color
        borderRadius: BorderRadius.circular(baseSize * 2),
        border: Border.all(color: isDark ? Colors.grey.shade700 : Colors.grey.shade300), // Your grey shades
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: searchQuery.isEmpty
                ? Text(
                    service,
                    style: GoogleFonts.poppins(
                      fontSize: baseSize * 3.5,
                      fontWeight: FontWeight.w500,
                      color: AppConstants.kBorderBlue, // Your exact blue color
                    ),
                  )
                : _buildHighlightedText(service, searchQuery, isDark),
          ),
          Icon(
            Icons.north_east,
            size: baseSize * 7,
            color: Colors.blue.shade900, // Your exact blue shade
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightedText(String text, String query, bool isDark) {
    final textSpans = <TextSpan>[];
    final pattern = RegExp(query, caseSensitive: false);
    final matches = pattern.allMatches(text);

    int currentIndex = 0;
    
    for (final match in matches) {
      if (match.start > currentIndex) {
        textSpans.add(
          TextSpan(
            text: text.substring(currentIndex, match.start),
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3.5,
              fontWeight: FontWeight.w500,
              color: AppConstants.kBorderBlue, // Your exact blue color
            ),
          ),
        );
      }
      
      textSpans.add(
        TextSpan(
          text: text.substring(match.start, match.end),
          style: GoogleFonts.poppins(
            fontSize: baseSize * 3.5,
            fontWeight: FontWeight.w600,
            color: Colors.blue.shade900, // Your exact blue shade
          ),
        ),
      );
      
      currentIndex = match.end;
    }
    
    if (currentIndex < text.length) {
      textSpans.add(
        TextSpan(
          text: text.substring(currentIndex),
          style: GoogleFonts.poppins(
            fontSize: baseSize * 3.5,
            fontWeight: FontWeight.w500,
            color: AppConstants.kBorderBlue, // Your exact blue color
          ),
        ),
      );
    }
    
    return RichText(
      text: TextSpan(children: textSpans),
    );
  }

  Widget _buildEmptyState(BuildContext context, bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: baseSize * 20,
            color: isDark ? Colors.grey.shade600 : Colors.grey.shade300, // Your grey shades
          ),
          SizedBox(height: baseSize * 3),
          Text(
            DefaultString.instance.searchForFinancialServices,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4,
              color: isDark ? Colors.grey.shade400 : Colors.grey.shade600, // Your grey shades
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: baseSize * 1),
          Text(
            DefaultString.instance.tryFinanceLoanInvestment,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3.2,
              color: isDark ? Colors.grey.shade500 : Colors.grey.shade500, // Your grey shades
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoResults(BuildContext context, bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: baseSize * 15,
            color: isDark ? Colors.grey.shade500 : Colors.grey.shade400, // Your grey shades
          ),
          SizedBox(height: baseSize * 2),
          Text(
            "${DefaultString.instance.noResultsFound} '${searchController.text}'",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4,
              color: isDark ? Colors.grey.shade400 : Colors.grey.shade600, // Your grey shades
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: baseSize * 1),
          Text(
            DefaultString.instance.tryDifferentKeywords,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3.2,
              color: isDark ? Colors.grey.shade500 : Colors.grey.shade500, // Your grey shades
            ),
          ),
        ],
      ),
    );
  }
}