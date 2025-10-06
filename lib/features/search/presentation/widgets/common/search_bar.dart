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
          child: Container(
            height: SizingUtils.dynamicHeight(0.055, context),
            decoration: BoxDecoration(
              border: Border.all(color: AppConstants.kBorderBlue),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                SizedBox(width: SizingUtils.dynamicWidth(0.03, context)),
                Icon(
                  Icons.search,
                  size: SizingUtils.dynamicFont(0.024, context),
                  color: Colors.grey.shade600,
                ),
                SizedBox(width: SizingUtils.dynamicWidth(0.02, context)),
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // hintText: showSearchResults 
                      //     ? "Search financial services..." 
                      //     : "Search...",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: SizingUtils.dynamicFont(0.016, context),
                        color: Colors.grey.shade500,
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: SizingUtils.dynamicFont(0.016, context),
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      if (showSearchResults) {
                        ref.read(financialSearchQueryProvider.notifier).state = value;
                      }
                      (context as Element).markNeedsBuild();
                    },
                  ),
                ),
                // Always show the X icon (removed the condition)
                Container(
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
                      size: SizingUtils.dynamicFont(0.014, context),
                      color: const Color.fromARGB(255, 255, 253, 253),
                    ),
                    onPressed: onClear,
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(width: SizingUtils.dynamicWidth(0.02, context)),
              ],
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