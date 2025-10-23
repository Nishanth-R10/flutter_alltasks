// File: lib/features/search/presentation/widgets/search_option_item.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class SearchOptionItem extends StatelessWidget {
  final String option;
  final VoidCallback onTap;

  const SearchOptionItem({
    super.key,
    required this.option,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQueryUtils.h(8)),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQueryUtils.w(16),
            vertical: MediaQueryUtils.h(12),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                option,
                style: GoogleFonts.poppins(
                  fontSize: MediaQueryUtils.sp(14),
                  color: const Color.fromARGB(255, 13, 13, 14),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.north_east,
                size: MediaQueryUtils.sp(16),
                color: const Color.fromARGB(255, 3, 3, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
