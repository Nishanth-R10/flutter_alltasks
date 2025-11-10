import 'package:flutter/material.dart';
import 'quick_actions_header.dart';
import 'quick_actions_grid.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const QuickActionsHeader(),
        SizedBox(height: screenHeight * 0.02),
        const QuickActionsGrid(),
      ],
    );
  }
}