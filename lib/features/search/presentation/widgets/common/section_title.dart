// File: lib/features/search/presentation/widgets/section_title.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: MediaQueryUtils.sp(16),
        fontWeight: FontWeight.w600,
        color: const Color.fromARGB(255, 7, 7, 7),
      ),
    );
  }
}