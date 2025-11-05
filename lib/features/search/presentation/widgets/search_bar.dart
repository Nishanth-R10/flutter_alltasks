import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/search/presentation/controller/search_state_provider.dart';

class SearchBarWidget extends ConsumerWidget {
  final TextEditingController controller;
  final VoidCallback onCancel;
  final VoidCallback onClear;
  final double baseSize;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onClear,
    required this.baseSize,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Row(
      children: [
        Expanded(child: _buildSearchContainer(context, isDark, ref)),
        SizedBox(width: baseSize * 1),
        _buildCancelButton(context),
      ],
    );
  }

  Widget _buildSearchContainer(BuildContext context, bool isDark, WidgetRef ref) {
    return Container(
      height: baseSize * 12,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          SizedBox(width: baseSize * 3),
          Icon(
            Icons.search,
            size: baseSize * 5,
            color: _getIconColor(isDark),
          ),
          SizedBox(width: baseSize * 2),
          Expanded(child: _buildTextField(isDark, ref)),
          _buildClearButton(context),
          SizedBox(width: baseSize * 2),
        ],
      ),
    );
  }

  Color _getIconColor(bool isDark) => isDark ? Colors.grey.shade400 : Colors.grey.shade600;

  Widget _buildTextField(bool isDark, WidgetRef ref) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Search for services...",
        hintStyle: GoogleFonts.poppins(
          fontSize: baseSize * 3.5,
          color: _getHintColor(isDark),
        ),
      ),
      style: GoogleFonts.poppins(
        fontSize: baseSize * 3.5,
        color: _getTextColor(isDark),
      ),
      onChanged: (value) {
        ref.read(searchQueryProvider.notifier).state = value;
      },
    );
  }

  Color _getHintColor(bool isDark) => isDark ? Colors.grey.shade400 : Colors.grey.shade500;
  Color _getTextColor(bool isDark) => isDark ? Colors.white : Colors.black;

  Widget _buildClearButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(baseSize),
      width: baseSize * 8,
      height: baseSize * 8,
      decoration: BoxDecoration(
        color: const Color(0xFF818181),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(Icons.close, size: baseSize * 4, color: Colors.white),
        onPressed: onClear,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return TextButton(
      onPressed: onCancel,
      child: Text(
        "Cancel",
        style: GoogleFonts.poppins(
          color: Colors.blue,
          fontSize: baseSize * 3.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}