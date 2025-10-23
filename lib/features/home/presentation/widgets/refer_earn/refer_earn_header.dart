<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class ReferEarnHeader extends StatelessWidget {
  const ReferEarnHeader({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return SizedBox(
      width: MediaQueryUtils.w(343),
      height: MediaQueryUtils.h(32),
      child: Text(
        "Refer & Earn",
        style: GoogleFonts.dmSans(
          fontSize: MediaQueryUtils.sp(19),
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 0,
          height: 1.2,
        ),
      ),
    );
  }
=======
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class ReferEarnHeader extends StatelessWidget {
  const ReferEarnHeader({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Container(
      width: MediaQueryUtils.w(343),
      height: MediaQueryUtils.h(32),
      child: Text(
        "Refer & Earn",
        style: GoogleFonts.dmSans(
          fontSize: MediaQueryUtils.sp(19),
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 0,
          height: 1.2,
        ),
      ),
    );
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}