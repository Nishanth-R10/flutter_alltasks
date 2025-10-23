import 'package:flutter/material.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'rewards_header.dart';
import 'rewards_card.dart';
import 'progress_card.dart';

class RewardsSection extends StatelessWidget {
  const RewardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RewardsHeader(),
        SizedBox(height: MediaQueryUtils.h(1)),
        const RewardsCard(),
        SizedBox(height: MediaQueryUtils.h(12)),
        const ProgressCard(),
      ],
    );
  }
}
