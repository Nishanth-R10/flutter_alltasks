import 'package:flutter/material.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'quick_actions_header.dart';
import 'quick_actions_grid.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const QuickActionsHeader(),
        SizedBox(height: MediaQueryUtils.h(16)),
        const QuickActionsGrid(),
      ],
    );
  }
}