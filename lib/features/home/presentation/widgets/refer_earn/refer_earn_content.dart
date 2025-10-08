import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class ReferEarnContent extends StatelessWidget {
  const ReferEarnContent({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Stack(
      clipBehavior: Clip.none, 
      children: [
        _buildContentCard(),
        _buildGiftImage(),
      ],
    );
  }

  Widget _buildContentCard() {
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(15)),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 235, 235, 235),
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03), 
            blurRadius: MediaQueryUtils.r(8)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDescription(),
          SizedBox(height: MediaQueryUtils.h(12)),
          _buildReferralCodeSection(),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      'Invite friends and earn 50 points\nfor each successful referral!',
      style: TextStyle(
        fontFamily: 'Diodrum Arabic',
        fontWeight: FontWeight.w500,
        fontSize: MediaQueryUtils.sp(14),
        height: 1.4,
        letterSpacing: 0,
        color: Colors.black,
      ),
    );
  }

  Widget _buildReferralCodeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildReferralCode(),
        _buildShareButton(),
      ],
    );
  }

  Widget _buildReferralCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQueryUtils.w(100),
          child: Text(
            'Your Referral Code',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Diodrum Arabic',
              fontWeight: FontWeight.w500,
              fontSize: MediaQueryUtils.sp(12),
              height: 1.2,
              letterSpacing: 0,
              color: Colors.black
            ),
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(6)),
        Row(
          children: [
            Text(
              'F R I E N D 2 0 2 4',
              style: GoogleFonts.poppins(
                fontSize: MediaQueryUtils.sp(14),
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(width: MediaQueryUtils.w(6)),
            Icon(
              Icons.copy,
              size: MediaQueryUtils.sp(18),
              color: const Color(0xFF4197CB),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShareButton() {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          Text(
            'Share Link', 
            style: GoogleFonts.poppins(
              color: const Color(0xFF4197CB),
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(width: MediaQueryUtils.w(4)),
          const Icon(
            Icons.share,
            color: Color(0xFF4197CB),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftImage() {
    return Positioned(
      top: MediaQueryUtils.h(-30),  
      right: MediaQueryUtils.w(20), 
      child: Image.asset(
        'assets/images/gift.png',
        width: MediaQueryUtils.w(86), 
        height: MediaQueryUtils.h(82), 
      ),
    );
  }
}