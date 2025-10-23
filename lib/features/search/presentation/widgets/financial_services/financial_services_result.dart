<<<<<<< HEAD
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
    if (searchController.text.isEmpty) {
      return _buildEmptyState();
    }

    if (searchResults.isEmpty) {
      return _buildNoResults();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DefaultString.instance.searchResults,
          style: GoogleFonts.poppins(
            fontSize: baseSize * 4.2,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: baseSize * 2),
        Expanded(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return _buildSearchResultItem(searchResults[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResultItem(String service) {
    final searchQuery = searchController.text.toLowerCase();
    
    return Container(
      margin: EdgeInsets.only(bottom: baseSize * 2),
      padding: EdgeInsets.all(baseSize * 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(baseSize * 2),
        border: Border.all(color: Colors.grey.shade300),
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
                      color: AppConstants.kBorderBlue,
                    ),
                  )
                : _buildHighlightedText(service, searchQuery),
          ),
          Icon(
            Icons.north_east,
            size: baseSize * 7,
            color: Colors.blue.shade900,
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightedText(String text, String query) {
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
              color: AppConstants.kBorderBlue,
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
            color: Colors.blue.shade900,
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
            color: AppConstants.kBorderBlue,
          ),
        ),
      );
    }
    
    return RichText(
      text: TextSpan(children: textSpans),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: baseSize * 20,
            color: Colors.grey.shade300,
          ),
          SizedBox(height: baseSize * 3),
          Text(
            DefaultString.instance.searchForFinancialServices,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: baseSize * 1),
          Text(
            DefaultString.instance.tryFinanceLoanInvestment,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3.2,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: baseSize * 15,
            color: Colors.grey.shade400,
          ),
          SizedBox(height: baseSize * 2),
          Text(
            "${DefaultString.instance.noResultsFound} '${searchController.text}'",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: baseSize * 1),
          Text(
            DefaultString.instance.tryDifferentKeywords,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3.2,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
=======
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
    if (searchController.text.isEmpty) {
      return _buildEmptyState();
    }

    if (searchResults.isEmpty) {
      return _buildNoResults();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DefaultString.instance.searchResults,
          style: GoogleFonts.poppins(
            fontSize: baseSize * 4.2,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: baseSize * 2),
        Expanded(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return _buildSearchResultItem(searchResults[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResultItem(String service) {
    final searchQuery = searchController.text.toLowerCase();
    
    return Container(
      margin: EdgeInsets.only(bottom: baseSize * 2),
      padding: EdgeInsets.all(baseSize * 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(baseSize * 2),
        border: Border.all(color: Colors.grey.shade300),
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
                      color: AppConstants.kBorderBlue,
                    ),
                  )
                : _buildHighlightedText(service, searchQuery),
          ),
          Icon(
            Icons.north_east,
            size: baseSize * 7,
            color: Colors.blue.shade900,
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightedText(String text, String query) {
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
              color: AppConstants.kBorderBlue,
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
            color: Colors.blue.shade900,
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
            color: AppConstants.kBorderBlue,
          ),
        ),
      );
    }
    
    return RichText(
      text: TextSpan(children: textSpans),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: baseSize * 20,
            color: Colors.grey.shade300,
          ),
          SizedBox(height: baseSize * 3),
          Text(
            DefaultString.instance.searchForFinancialServices,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: baseSize * 1),
          Text(
            DefaultString.instance.tryFinanceLoanInvestment,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3.2,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: baseSize * 15,
            color: Colors.grey.shade400,
          ),
          SizedBox(height: baseSize * 2),
          Text(
            "${DefaultString.instance.noResultsFound} '${searchController.text}'",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: baseSize * 1),
          Text(
            DefaultString.instance.tryDifferentKeywords,
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3.2,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}