import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_constants.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/search/presentation/widgets/returning_user/search_option_item.dart';
import 'package:tasks/features/search/presentation/widgets/returning_user/suggestion_card_item.dart';

class ReturningUserInterface extends StatelessWidget {
  final TextEditingController searchController;
  const ReturningUserInterface({super.key, required this.searchController});

  void _onSearchChanged(String query) {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    MediaQueryUtils.init(context);
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(DefaultString.instance.searchFor, isDark),
          SizedBox(height: MediaQueryUtils.h(8)),
          Column(children: AppConstants.searchOptions.map((option) {
            return SearchOptionItem(option: option, onTap: () => _onSearchChanged(option));
          }).toList()),
          SizedBox(height: MediaQueryUtils.h(12)),
          _buildSectionTitle(DefaultString.instance.suggestions, isDark),
          SizedBox(height: MediaQueryUtils.h(8)),
          Row(children: [
            Expanded(child: SuggestionCardItem(title: DefaultString.instance.mobileRecharge, onTap: () => _onSearchChanged(DefaultString.instance.mobileRecharge))),
            SizedBox(width: MediaQueryUtils.w(12)),
            Expanded(child: SuggestionCardItem(title: DefaultString.instance.offersSearch, onTap: () => _onSearchChanged(DefaultString.instance.offersSearch))),
          ]),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Text(title, style: GoogleFonts.poppins(
      fontSize: MediaQueryUtils.sp(16),
      fontWeight: FontWeight.w600,
      color: isDark ? Colors.white : const Color.fromARGB(255, 7, 7, 7),
    ));
  }
}