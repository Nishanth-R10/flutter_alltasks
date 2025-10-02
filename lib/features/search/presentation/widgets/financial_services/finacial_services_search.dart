// File: lib/features/search/presentation/widgets/financial_services/financial_services_search_bar.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/core/constants/app_constants.dart';

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
    return Row(
      children: [
        Expanded(
          child: Container(
            height: baseSize * 12,
            decoration: BoxDecoration(
              border: Border.all(color: AppConstants.kBorderBlue),
              borderRadius: BorderRadius.circular(baseSize * 6),
            ),
            child: Row(
              children: [
                SizedBox(width: baseSize * 3),
                Icon(
                  Icons.search,
                  size: baseSize * 5,
                  color: Colors.grey.shade600,
                ),
                SizedBox(width: baseSize * 2),
                Expanded(
                  child: TextField(
                    controller: controller,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search financial services...",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: baseSize * 3.5,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: baseSize * 3.5,
                      color: Colors.black,
                    ),
                  ),
                ),
                if (controller.text.isNotEmpty)
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: baseSize * 4,
                      color: Colors.grey.shade600,
                    ),
                    onPressed: onClear,
                  ),
                SizedBox(width: baseSize * 2),
              ],
            ),
          ),
        ),
        SizedBox(width: baseSize * 2),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: GoogleFonts.poppins(
              color: AppConstants.kBorderBlue,
              fontSize: baseSize * 3.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}