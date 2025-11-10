import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'rewards_header.dart';
import 'rewards_card.dart';
import 'rewards_progress_card.dart';

class RewardsSection extends ConsumerWidget {
  const RewardsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RewardsHeader(),
        SizedBox(height: screenHeight * 0.01),
        const RewardsCard(),
        SizedBox(height: screenHeight * 0.015),
        const ProgressCard(), 
      ],
    );
  }
}