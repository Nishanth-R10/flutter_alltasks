import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class RewardsCard extends StatelessWidget {
  const RewardsCard({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(15)),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 235, 235, 235),
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: MediaQueryUtils.r(6),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.card_giftcard,
            size: MediaQueryUtils.sp(20),
            color: const Color(0xFF4197CB),
          ),
          SizedBox(width: MediaQueryUtils.w(15)),
          Text(
            '1285 Reward Points earned',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: MediaQueryUtils.sp(12),
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.north_east,
            size: MediaQueryUtils.sp(15),
            fontWeight: FontWeight.w900,
            color: const Color(0xFF4197CB),
          ),
        ],
      ),
    );
  }
}