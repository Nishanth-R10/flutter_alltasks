import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class QuickActionsHeader extends StatelessWidget {
  const QuickActionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Container(
      width: MediaQueryUtils.w(343),
      height: MediaQueryUtils.h(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DefaultString.instance.quickActions,
            style: GoogleFonts.dmSans(
              fontSize: MediaQueryUtils.sp(19),
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: 0,
              height: 1.2,
            ),
          ),
          _buildCustomizeButton(),
        ],
      ),
    );
  }

  Widget _buildCustomizeButton() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQueryUtils.w(12),
        vertical: MediaQueryUtils.h(6),
      ),
      child: Row(
        children: [
          Text(
            DefaultString.instance.customize,
            style: TextStyle(
              fontFamily: 'Diodrum Arabic',
              fontWeight: FontWeight.w600,
              fontSize: MediaQueryUtils.sp(12),
              color: const Color.fromARGB(255, 4, 0, 255),
              height: 1.2,
              letterSpacing: 0,
            ),
          ),
          SizedBox(width: MediaQueryUtils.w(4)),
          Icon(
            Icons.north_east,
            size: MediaQueryUtils.sp(12),
            color: const Color.fromARGB(255, 4, 0, 255),
          ),
        ],
      ),
    );
  }
}