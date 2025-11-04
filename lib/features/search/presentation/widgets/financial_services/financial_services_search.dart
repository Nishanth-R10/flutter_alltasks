import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_constants.dart';
import 'package:tasks/core/utils/sizing_utils.dart';

class FinancialServicesSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final double baseSize;
  final VoidCallback onClear;

  const FinancialServicesSearchBar({
    super.key,
    required this.controller,
    required this.baseSize,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      children: [
        Expanded(child: _buildSearchContainer(context, isDark)),
        SizedBox(width: SizingUtils.dynamicWidth(0.01, context)),
        _buildCancelButton(context),
      ],
    );
  }

  Widget _buildSearchContainer(BuildContext context, bool isDark) {
    return Container(
      height: baseSize * 12,
      decoration: BoxDecoration(
        border: Border.all(color: AppConstants.kBorderBlue),
        borderRadius: BorderRadius.circular(baseSize * 6),
      ),
      child: Row(
        children: [
          SizedBox(width: baseSize * 3),
          Icon(Icons.search, size: baseSize * 5, color: _getIconColor(isDark)),
          SizedBox(width: baseSize * 2),
          Expanded(child: _buildTextField(isDark)),
          _buildClearButton(context),
          SizedBox(width: SizingUtils.dynamicWidth(0.02, context)),
        ],
      ),
    );
  }

  Widget _buildTextField(bool isDark) {
    return TextField(
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: DefaultString.instance.searchDotDotDot,
        hintStyle: GoogleFonts.poppins(
          fontSize: baseSize * 3.5,
          color: _getHintColor(isDark),
        ),
      ),
      style: GoogleFonts.poppins(
        fontSize: baseSize * 3.5,
        color: _getTextColor(isDark),
      ),
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
        border: Border.all(
          color: const Color.fromARGB(255, 128, 127, 127),
          width: 1.5,
        ),
      ),
      child: IconButton(
        icon: Icon(
          Icons.close,
          size: SizingUtils.dynamicFont(0.014, context),
          color: const Color.fromARGB(255, 255, 253, 253),
        ),
        onPressed: onClear,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
        DefaultString.instance.cancel,
        style: GoogleFonts.poppins(
          color: AppConstants.kBorderBlue,
          fontSize: baseSize * 3.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getIconColor(bool isDark) =>
      isDark ? Colors.grey.shade400 : Colors.grey.shade600;
  Color _getHintColor(bool isDark) =>
      isDark ? Colors.grey.shade400 : Colors.grey.shade500;
  Color _getTextColor(bool isDark) => isDark ? Colors.white : Colors.black;
}
