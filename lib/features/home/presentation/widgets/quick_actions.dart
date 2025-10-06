import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_color.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);

    return Container(
      width: MediaQueryUtils.w(343),
      height: MediaQueryUtils.h(155),
      padding: EdgeInsets.only(
        top: MediaQueryUtils.h(8),
        left: MediaQueryUtils.w(8),
        right: MediaQueryUtils.w(8),
        bottom: MediaQueryUtils.h(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQueryUtils.w(327),
            height: MediaQueryUtils.h(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quick Actions',
                  style: GoogleFonts.poppins(
                    fontSize: MediaQueryUtils.sp(19),
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Customize ',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 4, 0, 255),
                        fontSize: MediaQueryUtils.sp(12),
                      ),
                    ),
                    SizedBox(width: MediaQueryUtils.w(1)),
                    Icon(
                      Icons.north_east,
                      size: MediaQueryUtils.sp(12),
                      color: const Color.fromARGB(255, 4, 0, 255),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQueryUtils.h(18)),
          Container(
            width: MediaQueryUtils.w(327),
            height: MediaQueryUtils.h(92),
            padding: EdgeInsets.all(MediaQueryUtils.w(12)),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 235, 235, 235),
              borderRadius: BorderRadius.circular(MediaQueryUtils.r(16)),
              border: Border.all(
                color: Colors.grey[400]!,
                width: MediaQueryUtils.w(1),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: MediaQueryUtils.r(8),
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _actionButton(icon: Icons.swap_horiz, label: 'Transfer'),
                _actionButton(
                  icon: Icons.account_balance_wallet,
                  label: 'Request',
                ),
                _actionButton(
                  icon: Icons.broken_image_outlined,
                  label: 'Stocks',
                ),
                _actionButton(icon: Icons.post_add_rounded, label: 'Products'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton({required IconData icon, required String label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQueryUtils.w(48),
          height: MediaQueryUtils.w(48),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F6FF),
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
          ),
          child: Center(
            child: Icon(
              icon,
              size: MediaQueryUtils.sp(24),
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(4)),
        SizedBox(
          width: MediaQueryUtils.w(58),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: MediaQueryUtils.sp(11),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}