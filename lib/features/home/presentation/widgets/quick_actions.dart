import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_color.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Quick Actions',
                style: GoogleFonts.poppins(
                  fontSize: MediaQueryUtils.sp(19),
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                )),
            Row(
              children: [
                Text('Customize ',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 4, 0, 255),
                      fontSize: MediaQueryUtils.sp(12),
                    )),
                SizedBox(width: MediaQueryUtils.w(1)),
                Icon(Icons.north_east, size: MediaQueryUtils.sp(12), color: const Color.fromARGB(255, 4, 0, 255),)
              ],
            )
          ],
        ),
        SizedBox(height: MediaQueryUtils.h(14)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQueryUtils.w(12), vertical: MediaQueryUtils.h(12)),
          decoration: BoxDecoration(
             color: Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(14)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: MediaQueryUtils.r(8),
                  offset: const Offset(0, 2)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _actionButton(icon: Icons.swap_horiz, label: 'Transfer'),
              _actionButton(icon: Icons.account_balance_wallet, label: 'QMP'),
              _actionButton(icon: Icons.view_list_sharp, label: 'Request'),
              _actionButton(icon: Icons.receipt_long, label: 'Bills'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _actionButton({required IconData icon, required String label}) {
    return Column(
      children: [
        Container(
          width: MediaQueryUtils.w(58),
          height: MediaQueryUtils.w(58),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F6FF),
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
          ),
          child: Center(
              child: Icon(icon, size: MediaQueryUtils.sp(24), color: AppColors.primary)),
        ),
        SizedBox(height: MediaQueryUtils.h(8)),
        SizedBox(
            width: MediaQueryUtils.w(68),
            child: Text(label,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: MediaQueryUtils.sp(12))))
      ],
    );
  }
}