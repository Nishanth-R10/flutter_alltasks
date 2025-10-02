// File: lib/features/search/presentation/pages/newuser_searchscreen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/search/presentation/widgets/financial_services/feature_container.dart';
import 'package:tasks/features/search/presentation/widgets/new_user_search/search_chip_item.dart';

import '../widgets/common/search_bar.dart';
import '../widgets/new_user_search/search_chip_row.dart';
import '../widgets/common/section_title.dart';
@RoutePage()
class NewUserSearchScreen extends ConsumerWidget {
  const NewUserSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    final Size screenSize = MediaQuery.of(context).size;
    final double baseSize = screenSize.width * 0.01;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(baseSize * 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(
                controller: searchController,
                onCancel: () => Navigator.pop(context),
                onClear: () => searchController.clear(),
                baseSize: baseSize,
              ),
              SizedBox(height: baseSize * 3),

              // Search for section
              SectionTitle(title: "Search for", baseSize: baseSize),
              SizedBox(height: baseSize * 2),

              // Search chips rows
              SearchChipRow(
                titles: ["Mobile Recharge", "Track Billers"],
                icons: [Icons.phone_android, Icons.receipt_long],
                baseSize: baseSize,
              ),
              SizedBox(height: baseSize * 2),

              SearchChipRow(
                titles: ["Credit card Bills", "Offers"],
                icons: [Icons.credit_card, Icons.local_offer],
                baseSize: baseSize,
              ),
              SizedBox(height: baseSize * 2),

              // Single chip
              SearchChipItem(
                title: "Your Cheque book",
                icon: Icons.book,
                baseSize: baseSize,
              ),
              SizedBox(height: baseSize * 3),

              // What's new? section
              SectionTitle(title: "What's new?", baseSize: baseSize),
              SizedBox(height: baseSize * 2),

              // Feature containers
              FeatureContainerRow(baseSize: baseSize),
            ],
          ),
        ),
      ),
    );
  }
}