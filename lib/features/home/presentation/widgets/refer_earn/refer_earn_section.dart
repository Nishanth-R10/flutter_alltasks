// lib/features/home/presentation/widgets/refer_earn_section/refer_earn_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/home/application/referral_provider.dart';
import 'package:tasks/features/home/domain/entities/referral_entity.dart';
import 'package:tasks/features/home/presentation/widgets/offer_section/shrimmer/shimmer_widget.dart';
import 'refer_earn_header.dart';

class ReferEarnSection extends ConsumerWidget {
  const ReferEarnSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryUtils.init(context);
    final referralAsync = ref.watch(referralFutureProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ReferEarnHeader(),
        SizedBox(height: MediaQueryUtils.h(12)),
        referralAsync.when(
          loading: () => _buildReferralShimmer(),
          error: (error, stack) => _buildReferralError(error, ref),
          data: (referral) => _buildReferralCard(referral),
        ),
      ],
    );
  }

  Widget _buildReferralCard(ReferralEntity referral) {
    return Container(
      width: MediaQueryUtils.w(343),
      padding: EdgeInsets.all(MediaQueryUtils.w(16)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
        ),
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            blurRadius: MediaQueryUtils.r(8),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Refer Friends & Earn',
            style: GoogleFonts.poppins(
              fontSize: MediaQueryUtils.sp(18),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: MediaQueryUtils.h(8)),
          Text(
            'Share your referral code and earn ${referral.rewardPoints} points for each friend who joins',
            style: GoogleFonts.poppins(
              fontSize: MediaQueryUtils.sp(12),
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          SizedBox(height: MediaQueryUtils.h(16)),
          Container(
            padding: EdgeInsets.all(MediaQueryUtils.w(12)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Referral Code',
                        style: GoogleFonts.poppins(
                          fontSize: MediaQueryUtils.sp(12),
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(height: MediaQueryUtils.h(4)),
                      Text(
                        referral.referralCode,
                        style: GoogleFonts.poppins(
                          fontSize: MediaQueryUtils.sp(16),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Copy referral code
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF667eea),
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQueryUtils.w(16),
                      vertical: MediaQueryUtils.h(8),
                    ),
                  ),
                  child: Text(
                    'Copy',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQueryUtils.h(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Friends Referred', '${referral.friendsReferred}'),
              _buildStatItem('Total Earnings', 'QAR ${referral.totalEarnings.toInt()}'),
              _buildStatItem('Points Earned', '${referral.rewardPoints}'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: MediaQueryUtils.sp(16),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(4)),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: MediaQueryUtils.sp(10),
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildReferralShimmer() {
    return ShimmerWidget(
      child: Container(
        width: MediaQueryUtils.w(343),
        padding: EdgeInsets.all(MediaQueryUtils.w(16)),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(MediaQueryUtils.r(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQueryUtils.w(150),
              height: MediaQueryUtils.h(20),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
              ),
            ),
            SizedBox(height: MediaQueryUtils.h(8)),
            Container(
              width: MediaQueryUtils.w(250),
              height: MediaQueryUtils.h(14),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
              ),
            ),
            SizedBox(height: MediaQueryUtils.h(16)),
            Container(
              padding: EdgeInsets.all(MediaQueryUtils.w(12)),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQueryUtils.w(100),
                          height: MediaQueryUtils.h(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
                          ),
                        ),
                        SizedBox(height: MediaQueryUtils.h(4)),
                        Container(
                          width: MediaQueryUtils.w(120),
                          height: MediaQueryUtils.h(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQueryUtils.w(60),
                    height: MediaQueryUtils.h(32),
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQueryUtils.h(12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItemShimmer(),
                _buildStatItemShimmer(),
                _buildStatItemShimmer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItemShimmer() {
    return Column(
      children: [
        Container(
          width: MediaQueryUtils.w(40),
          height: MediaQueryUtils.h(16),
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(4)),
        Container(
          width: MediaQueryUtils.w(60),
          height: MediaQueryUtils.h(10),
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
          ),
        ),
      ],
    );
  }

  Widget _buildReferralError(Object error, WidgetRef ref) {
    return Container(
      width: MediaQueryUtils.w(343),
      padding: EdgeInsets.all(MediaQueryUtils.w(16)),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(16)),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: MediaQueryUtils.w(20)),
              SizedBox(width: MediaQueryUtils.w(12)),
              Expanded(
                child: Text(
                  'Failed to load referral details',
                  style: GoogleFonts.poppins(
                    fontSize: MediaQueryUtils.sp(14),
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQueryUtils.h(12)),
          ElevatedButton(
            onPressed: () {
              ref.invalidate(referralFutureProvider);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }
}