
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_color.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Quick Actions',
                style: GoogleFonts.poppins(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                )),
            Row(
              children: [
                Text('Customize ',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 4, 0, 255),
                      fontSize: 12.sp,
                    )),
                SizedBox(width: 1.w),
                Icon(Icons.north_east, size: 12.sp, color: const Color.fromARGB(255, 4, 0, 255),)
              ],
            )
          ],
        ),
        SizedBox(height: 14.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
             color:Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8.r,
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
          width: 58.w,
          height: 58.w,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F6FF),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
              child: Icon(icon, size: 24.sp, color: AppColors.primary)),
        ),
        SizedBox(height: 8.h),
        SizedBox(
            width: 68.w,
            child: Text(label,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 12.sp)))
      ],
    );
  }
}