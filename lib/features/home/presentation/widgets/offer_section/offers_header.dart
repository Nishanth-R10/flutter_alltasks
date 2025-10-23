
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class OffersHeader extends StatelessWidget {
  const OffersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Container(
      width: MediaQueryUtils.w(343),
      height: MediaQueryUtils.h(24), 
      child: Text(
        DefaultString.instance.offers,
        style: GoogleFonts.dmSans(
          fontSize: MediaQueryUtils.sp(19),
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 0,
          height: 1.0, 
        ),
      ),
    );
  }
}