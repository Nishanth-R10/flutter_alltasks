import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';

class RewardsSection extends StatelessWidget {
  const RewardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQueryUtils.w(343),
          height: MediaQueryUtils.h(32),
          child: Text(
            "Rewards",
            style: GoogleFonts.dmSans(
              fontSize: MediaQueryUtils.sp(19),
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: 0,
              height: 1.2,
            ),
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(1)),
        Container(
          padding: EdgeInsets.all(MediaQueryUtils.w(15)),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 235, 235),
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
                color: Color(0xFF4197CB),
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
              Spacer(),
              Icon(
                Icons.north_east,
                size: MediaQueryUtils.sp(15),fontWeight: FontWeight.w900,
                color: Color(0xFF4197CB),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(12)),
        Container(
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
              Container(
                width: MediaQueryUtils.w(311),
                height: MediaQueryUtils.h(40),
                child: Row(
                  children: [
                    Container(
                      width: MediaQueryUtils.w(40),
                      height: MediaQueryUtils.w(40),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 210, 238, 253),
                        borderRadius: BorderRadius.circular(
                          MediaQueryUtils.r(12),
                        ),
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
                    ),
                    SizedBox(width: MediaQueryUtils.w(16)),
                    Expanded(
                      child: Text(
                        'Claim upto 150 reward points after reaching the next transaction goal.',
                        style: GoogleFonts.poppins(
                          fontSize: MediaQueryUtils.sp(12),
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQueryUtils.h(16)),
              Container(
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
                              borderRadius: BorderRadius.circular(
                                MediaQueryUtils.r(20),
                              ),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.65,
                            child: Container(
                              height: MediaQueryUtils.h(10),
                              decoration: BoxDecoration(
                               color: Color(0xFF4197CB),
                                borderRadius: BorderRadius.circular(
                                  MediaQueryUtils.r(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: MediaQueryUtils.w(8)),
                    Text(
                      '240 QAR away',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQueryUtils.sp(11),
                        color: const Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}