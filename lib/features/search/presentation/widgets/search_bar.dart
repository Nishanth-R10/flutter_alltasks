import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_constants.dart';
import 'package:tasks/core/utils/sizing_utils.dart';
import 'package:tasks/features/search/presentation/search_provider.dart';

class SearchBarWidget extends ConsumerWidget {
  final TextEditingController controller;
  final VoidCallback onCancel;
  final VoidCallback onClear;
  final double baseSize;
  final bool showSearchResults;
  final bool isNewUser;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onClear,
    required this.baseSize,
    this.showSearchResults = false,
    required this.isNewUser,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Row(
      children: [
        Expanded(child: _buildSearchContainer(context, isDark, ref)),
        SizedBox(width: SizingUtils.dynamicWidth(0.01, context)),
        _buildCancelButton(context),
      ],
    );
  }

  Widget _buildSearchContainer(BuildContext context, bool isDark, WidgetRef ref) {
    return Container(
      height: SizingUtils.dynamicHeight(0.055, context),
      decoration: BoxDecoration(
        border: Border.all(color: AppConstants.kBorderBlue),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          SizedBox(width: SizingUtils.dynamicWidth(0.03, context)),
          Icon(Icons.search, size: SizingUtils.dynamicFont(0.024, context), color: _getIconColor(isDark)),
          SizedBox(width: SizingUtils.dynamicWidth(0.02, context)),
          Expanded(child: _buildTextField(context, isDark, ref)),
          _buildClearButton(context),
          SizedBox(width: SizingUtils.dynamicWidth(0.02, context)),
        ],
      ),
    );
  }

  Widget _buildTextField(BuildContext context, bool isDark, WidgetRef ref) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: DefaultString.instance.searchDotDotDot,
        hintStyle: GoogleFonts.poppins(
          fontSize: SizingUtils.dynamicFont(0.016, context), // FIXED: Added context
          color: _getHintColor(isDark),
        ),
      ),
      style: GoogleFonts.poppins(
        fontSize: SizingUtils.dynamicFont(0.016, context), // FIXED: Added context
        color: _getTextColor(isDark),
      ),
      onChanged: (value) {
        if (showSearchResults) {
          ref.read(financialSearchQueryProvider.notifier).state = value;
        }
      },
    );
  }

  Widget _buildClearButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(SizingUtils.dynamicHeight(0.008, context)),
      width: SizingUtils.dynamicHeight(0.03, context),
      height: SizingUtils.dynamicHeight(0.03, context),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 129, 129, 129),
        shape: BoxShape.circle,
        border: Border.all(color: const Color.fromARGB(255, 128, 127, 127), width: 1.5),
      ),
      child: IconButton(
        icon: Icon(
          Icons.close, 
          size: SizingUtils.dynamicFont(0.014, context), // FIXED: Added context
          color: const Color.fromARGB(255, 255, 253, 253),
        ),
        onPressed: onClear,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return TextButton(
      onPressed: onCancel,
      child: Text(
        DefaultString.instance.cancel, 
        style: GoogleFonts.poppins(
          color: AppConstants.kBorderBlue,
          fontSize: SizingUtils.dynamicFont(0.018, context), // FIXED: Added context
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getIconColor(bool isDark) => isDark ? Colors.grey.shade400 : Colors.grey.shade600;
  Color _getHintColor(bool isDark) => isDark ? Colors.grey.shade400 : Colors.grey.shade500;
  Color _getTextColor(bool isDark) => isDark ? Colors.white : Colors.black;
}