// lib/features/search/presentation/widgets/unified_search/new_user_interface.dart
import 'package:flutter/material.dart';
import 'package:tasks/features/search/presentation/widgets/common/section_title.dart';
import 'package:tasks/features/search/presentation/widgets/financial_services/feature_container.dart';
import 'package:tasks/features/search/presentation/widgets/new_user_search/search_chip_item.dart';
import 'package:tasks/features/search/presentation/widgets/new_user_search/search_chip_row.dart';

class NewUserInterface extends StatelessWidget {
  final double baseSize;
  final TextEditingController searchController;

  const NewUserInterface({
    super.key,
    required this.baseSize,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Search for", baseSize: baseSize),
          SizedBox(height: baseSize * 2),

          SearchChipRow(
            titles: ["Mobile Recharge", "Track Billers"],
            icons: [Icons.phone_android, Icons.receipt_long],
            baseSize: baseSize,
          ),
          SizedBox(height: baseSize * 3),

          SearchChipRow(
            titles: ["Credit card Bills", "Offers"],
            icons: [Icons.credit_card, Icons.local_offer],
            baseSize: baseSize,
          ),
          SizedBox(height: baseSize * 3),

          SearchChipItem(
            title: "Your Cheque book",
            icon: Icons.book,
            baseSize: baseSize,
          ),
          SizedBox(height: baseSize * 3),

          SectionTitle(title: "What's new?", baseSize: baseSize),
          SizedBox(height: baseSize * 4),

          FeatureContainerRow(baseSize: baseSize),
        ],
      ),
    );
  }
}