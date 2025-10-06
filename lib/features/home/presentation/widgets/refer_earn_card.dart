import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class ReferEarnCard extends StatelessWidget {
  const ReferEarnCard({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Stack(
      clipBehavior: Clip.none, 
      children: [
        Container(
          padding: EdgeInsets.all(MediaQueryUtils.w(15)),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: MediaQueryUtils.r(8)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invite friends and earn 50 points\nfor each successful referral!',
                style: GoogleFonts.poppins(
                  fontSize: MediaQueryUtils.sp(13),
                  height: 1.5,
                ),
              ),
              SizedBox(height: MediaQueryUtils.h(12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Referral Code',
                        style: GoogleFonts.poppins(
                          fontSize: MediaQueryUtils.sp(12),
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: MediaQueryUtils.h(6)),
                      Row(
                        children: [
                          Text(
                            'F R I E N D 2 0 2 4',
                            style: GoogleFonts.poppins(
                              fontSize: MediaQueryUtils.sp(16),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(width: MediaQueryUtils.w(6)),
                          Icon(
                            Icons.copy,
                            size: MediaQueryUtils.sp(18),
                            color: const Color.fromARGB(255, 76, 171, 248),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text('Share Link', style: GoogleFonts.poppins(color: const Color.fromARGB(255, 76, 171, 248),)),
                        SizedBox(width: MediaQueryUtils.w(4)),
                        const Icon(Icons.share,color:  Color.fromARGB(255, 76, 171, 248),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQueryUtils.h(-30),  
          right: MediaQueryUtils.w(20), 
          child: Image.asset(
            'assets/images/gift.png',
            width: MediaQueryUtils.w(86),
            height: MediaQueryUtils.w(100),
          ),
        ),
      ],
    );
  }
}