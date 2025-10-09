import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/core/constants/app_constants.dart';
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
                      hintText: DefaultString.instance.searchDotDotDot,
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
          onPressed: () => Navigator.pop(context),
          child: Text(
            DefaultString.instance.cancel,
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