// File: lib/features/search/presentation/widgets/search_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/core/constants/app_constants.dart';
import 'package:tasks/core/utils/sizing_utils.dart';
import 'package:tasks/features/search/providers/financialservice_provider.dart';

class SearchBarWidget extends ConsumerWidget {
  final TextEditingController controller;
  final VoidCallback onCancel;
  final VoidCallback onClear;
  final double baseSize;
  final bool showSearchResults;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onClear,
    required this.baseSize,
    this.showSearchResults = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: SizingUtils.dynamicHeight(0.055, context),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: AppConstants.kBorderBlue,
                  ),
                ),
                hintText: showSearchResults 
                    ? "Search financial services..." 
                    : "Search...",
                hintStyle: GoogleFonts.poppins(
                  fontSize: SizingUtils.dynamicFont(0.016, context),
                  color: Colors.grey.shade500,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: SizingUtils.dynamicFont(0.024, context),
                  color: Colors.grey.shade600,
                ),
                suffixIcon: controller.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons.close,
                          size: SizingUtils.dynamicFont(0.018, context),
                          color: Colors.grey.shade600,
                        ),
                        onPressed: onClear,
                      )
                    : null,
                contentPadding: EdgeInsets.symmetric(
                  vertical: SizingUtils.dynamicHeight(0.012, context),
                  horizontal: SizingUtils.dynamicWidth(0.02, context),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    SizingUtils.dynamicHeight(0.03, context),
                  ),
                  borderSide: const BorderSide(
                    color: AppConstants.kBorderBlue,
                    width: 1,
                  ),
                ),
              ),
              onChanged: (value) {
                // Trigger search when text changes
                if (showSearchResults) {
                  // Use the correct provider from the new structure
                  ref.read(financialSearchQueryProvider.notifier).state = value;
                }
                (context as Element).markNeedsBuild();
              },
            ),
          ),
        ),
        SizedBox(width: SizingUtils.dynamicWidth(0.01, context)),
        TextButton(
          onPressed: onCancel,
          child: Text(
            "Cancel",
            style: GoogleFonts.poppins(
              color: AppConstants.kBorderBlue,
              fontSize: SizingUtils.dynamicFont(0.018, context),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}