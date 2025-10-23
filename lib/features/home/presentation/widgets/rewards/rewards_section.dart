import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/home/application/rewards_provider.dart';
import 'package:tasks/features/home/presentation/widgets/offer_section/shrimmer/shimmer_widget.dart';
import 'rewards_header.dart';
class RewardsSection extends ConsumerWidget {
  const RewardsSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryUtils.init(context);
    final rewardsAsync = ref.watch(rewardsFutureProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RewardsHeader(),
        SizedBox(height: MediaQueryUtils.h(12)),
        rewardsAsync.when(
          loading: () => _buildRewardsShimmer(),
          error: (error, stack) => _buildRewardsError(error, ref),
          data: (rewards) => Column(
            children: [
              _buildRewardsCard(rewards.pointsEarned),
              SizedBox(height: MediaQueryUtils.h(12)),
              _buildProgressCard(rewards.progressPercentage, rewards.amountAway),
            ],
          ),
        ),
      ],
    );
  }


}

  Widget _buildRewardsCard(int pointsEarned) {
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
            '$pointsEarned ${DefaultString.instance.rewardPointsEarned}',
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
            color: const Color(0xFF4197CB),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(double progressPercentage, double amountAway) {
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
          _buildProgressBar(progressPercentage, amountAway),
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

  Widget _buildProgressBar(double progressPercentage, double amountAway) {
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
                  widthFactor: progressPercentage,
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
            '${amountAway.toInt()} QAR ${DefaultString.instance.away}',
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

  Widget _buildRewardsShimmer() {
    return Column(
      children: [
        // Rewards Card Shimmer
        ShimmerWidget(
          child: Container(
            padding: EdgeInsets.all(MediaQueryUtils.w(15)),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
            ),
            child: Row(
              children: [
                Container(
                  width: MediaQueryUtils.w(20),
                  height: MediaQueryUtils.w(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: MediaQueryUtils.w(15)),
                Expanded(
                  child: Container(
                    height: MediaQueryUtils.h(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
                    ),
                  ),
                ),
                SizedBox(width: MediaQueryUtils.w(15)),
                Container(
                  width: MediaQueryUtils.w(15),
                  height: MediaQueryUtils.w(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(12)),
        // Progress Card Shimmer
        ShimmerWidget(
          child: Container(
            width: MediaQueryUtils.w(343),
            height: MediaQueryUtils.h(104),
            padding: EdgeInsets.all(MediaQueryUtils.w(16)),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
              border: Border.all(width: 1, color: Colors.grey.shade400),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Reward info shimmer
                SizedBox(
                  width: MediaQueryUtils.w(311),
                  height: MediaQueryUtils.h(40),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQueryUtils.w(40),
                        height: MediaQueryUtils.w(40),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
                        ),
                      ),
                      SizedBox(width: MediaQueryUtils.w(16)),
                      Expanded(
                        child: Container(
                          height: MediaQueryUtils.h(30),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(MediaQueryUtils.r(6)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQueryUtils.h(16)),
                // Progress bar shimmer
                SizedBox(
                  width: MediaQueryUtils.w(311),
                  height: MediaQueryUtils.h(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQueryUtils.h(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(MediaQueryUtils.r(20)),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQueryUtils.w(8)),
                      Container(
                        width: MediaQueryUtils.w(80),
                        height: MediaQueryUtils.h(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRewardsError(Object error, WidgetRef ref) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(MediaQueryUtils.w(15)),
          decoration: BoxDecoration(
            color: Colors.red[50],
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
          ),
          child: Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: MediaQueryUtils.w(20)),
              SizedBox(width: MediaQueryUtils.w(12)),
              Expanded(
                child: Text(
                  'Failed to load rewards',
                  style: GoogleFonts.poppins(
                    fontSize: MediaQueryUtils.sp(12),
                    color: Colors.red,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(rewardsFutureProvider);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQueryUtils.w(12),
                    vertical: MediaQueryUtils.h(6),
                  ),
                ),
                child: Text(
                  'Retry',
                  style: TextStyle(fontSize: MediaQueryUtils.sp(10)),
                ),
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
          child: Center(
            child: Text(
              'Rewards data unavailable',
              style: GoogleFonts.poppins(
                fontSize: MediaQueryUtils.sp(12),
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
