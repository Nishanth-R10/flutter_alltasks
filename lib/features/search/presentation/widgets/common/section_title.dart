// File: lib/features/search/presentation/widgets/section_title.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final double baseSize;

  const SectionTitle({
    super.key,
    required this.title,
    required this.baseSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: baseSize * 4.2,
        fontWeight: FontWeight.w600,
        color: const Color.fromARGB(255, 7, 7, 7),
      ),
    );
  }
}