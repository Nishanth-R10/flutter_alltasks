<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Container(
      width: MediaQueryUtils.w(343),
      height: MediaQueryUtils.h(104),
      padding: EdgeInsets.all(MediaQueryUtils.w(16)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
        border: Border.all(width: 1, color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRewardInfo(),
          SizedBox(height: MediaQueryUtils.h(16)),
          _buildProgressBar(),
        ],
      ),
    );
  }

  Widget _buildRewardInfo() {
    return SizedBox(
      width: MediaQueryUtils.w(311),
      height: MediaQueryUtils.h(40),
      child: Row(
        children: [
          _buildRewardBadge(),
          SizedBox(width: MediaQueryUtils.w(16)),
          _buildRewardDescription(),
        ],
      ),
    );
  }

  Widget _buildRewardBadge() {
    return Container(
      width: MediaQueryUtils.w(40),
      height: MediaQueryUtils.w(40),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 210, 238, 253),
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '150',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: MediaQueryUtils.sp(12),
                color: Colors.black,
              ),
            ),
            SizedBox(height: MediaQueryUtils.h(0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '+',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQueryUtils.sp(10),
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: MediaQueryUtils.w(0)),
                Image.asset(
                  'assets/images/coin.png',
                  width: MediaQueryUtils.w(20),
                  height: MediaQueryUtils.w(19),
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardDescription() {
    return Expanded(
      child: Text(
        DefaultString.instance.claimRewardPoints,
        style: GoogleFonts.poppins(
          fontSize: MediaQueryUtils.sp(12),
          fontWeight: FontWeight.w400,
          color: Colors.black87,
          height: 1.3,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildProgressBar() {
    return SizedBox(
      width: MediaQueryUtils.w(311),
      height: MediaQueryUtils.h(16),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: MediaQueryUtils.h(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFEF),
                    borderRadius: BorderRadius.circular(MediaQueryUtils.r(20)),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.65,
                  child: Container(
                    height: MediaQueryUtils.h(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4197CB),
                      borderRadius: BorderRadius.circular(MediaQueryUtils.r(20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: MediaQueryUtils.w(8)),
          Text(
            '240 QAR ${DefaultString.instance.away}',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: MediaQueryUtils.sp(11),
              color: const Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }
=======
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Container(
      width: MediaQueryUtils.w(343),
      height: MediaQueryUtils.h(104),
      padding: EdgeInsets.all(MediaQueryUtils.w(16)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
        border: Border.all(width: 1, color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRewardInfo(),
          SizedBox(height: MediaQueryUtils.h(16)),
          _buildProgressBar(),
        ],
      ),
    );
  }

  Widget _buildRewardInfo() {
    return Container(
      width: MediaQueryUtils.w(311),
      height: MediaQueryUtils.h(40),
      child: Row(
        children: [
          _buildRewardBadge(),
          SizedBox(width: MediaQueryUtils.w(16)),
          _buildRewardDescription(),
        ],
      ),
    );
  }

  Widget _buildRewardBadge() {
    return Container(
      width: MediaQueryUtils.w(40),
      height: MediaQueryUtils.w(40),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 210, 238, 253),
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '150',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: MediaQueryUtils.sp(12),
                color: Colors.black,
              ),
            ),
            SizedBox(height: MediaQueryUtils.h(0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '+',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQueryUtils.sp(10),
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: MediaQueryUtils.w(0)),
                Image.asset(
                  'assets/images/coin.png',
                  width: MediaQueryUtils.w(20),
                  height: MediaQueryUtils.w(19),
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardDescription() {
    return Expanded(
      child: Text(
        DefaultString.instance.claimRewardPoints,
        style: GoogleFonts.poppins(
          fontSize: MediaQueryUtils.sp(12),
          fontWeight: FontWeight.w400,
          color: Colors.black87,
          height: 1.3,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      width: MediaQueryUtils.w(311),
      height: MediaQueryUtils.h(16),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: MediaQueryUtils.h(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFEF),
                    borderRadius: BorderRadius.circular(MediaQueryUtils.r(20)),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.65,
                  child: Container(
                    height: MediaQueryUtils.h(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4197CB),
                      borderRadius: BorderRadius.circular(MediaQueryUtils.r(20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: MediaQueryUtils.w(8)),
          Text(
            '240 QAR ${DefaultString.instance.away}',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: MediaQueryUtils.sp(11),
              color: const Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}