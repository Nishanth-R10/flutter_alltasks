// new_user_search_results.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors/default_colors.dart';

class NewUserSearchResults extends StatelessWidget {
  final List<String> searchResults;
  final TextEditingController searchController;
  final double baseSize;

  const NewUserSearchResults({
    super.key,
    required this.searchResults,
    required this.searchController,
    required this.baseSize,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
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
          "Search Results",
          style: GoogleFonts.poppins(
            fontSize: baseSize * 4.2,
            fontWeight: FontWeight.w600,
            color: isDark ? DefaultColors.white : DefaultColors.black,
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
        color: isDark ? DefaultColors.black24 : DefaultColors.white,
        borderRadius: BorderRadius.circular(baseSize * 2),
        border: Border.all(color: isDark ? DefaultColors.gray7D : DefaultColors.grayCA),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: searchQuery.isEmpty
                ? _buildNormalText(service)
                : _buildHighlightedText(service, searchQuery, isDark),
          ),
          Icon(
            Icons.north_east,
            size: baseSize * 7,
            color: DefaultColors.blueBase,
          ),
        ],
      ),
    );
  }

  Widget _buildNormalText(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: baseSize * 3.5,
        fontWeight: FontWeight.w500,
        color: DefaultColors.blue9D,
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
        textSpans.add(TextSpan(
          text: text.substring(currentIndex, match.start),
          style: GoogleFonts.poppins(
            fontSize: baseSize * 3.5,
            fontWeight: FontWeight.w500,
            color: DefaultColors.blue9D,
          ),
        ));
      }
      
      textSpans.add(TextSpan(
        text: text.substring(match.start, match.end),
        style: GoogleFonts.poppins(
          fontSize: baseSize * 3.5,
          fontWeight: FontWeight.w600,
          color: DefaultColors.blueBase,
        ),
      ));
      
      currentIndex = match.end;
    }
    
    if (currentIndex < text.length) {
      textSpans.add(TextSpan(
        text: text.substring(currentIndex),
        style: GoogleFonts.poppins(
          fontSize: baseSize * 3.5,
          fontWeight: FontWeight.w500,
          color: DefaultColors.blue9D,
        ),
      ));
    }
    
    return RichText(text: TextSpan(children: textSpans));
  }

  Widget _buildEmptyState(BuildContext context, bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: baseSize * 20,
            color: isDark ? DefaultColors.gray62 : DefaultColors.grayCA,
          ),
          SizedBox(height: baseSize * 3),
          Text(
            "Search for services",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4,
              color: isDark ? DefaultColors.grayB0 : DefaultColors.gray62,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: baseSize * 1),
          Text(
            "Try 'Mobile', 'Bills', 'Offers'",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3.2,
              color: isDark ? DefaultColors.gray7D : DefaultColors.gray7D,
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
            color: isDark ? DefaultColors.gray7D : DefaultColors.grayCA,
          ),
          SizedBox(height: baseSize * 2),
          Text(
            "No results found for '${searchController.text}'",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4,
              color: isDark ? DefaultColors.grayB0 : DefaultColors.gray62,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: baseSize * 1),
          Text(
            "Try different keywords or check spelling",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3.2,
              color: isDark ? DefaultColors.gray7D : DefaultColors.gray7D,
            ),
          ),
        ],
      ),
    );
  }
}