import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors/default_colors.dart';
import 'feature_container.dart';
import 'search_chip_item.dart';
import 'search_chip_row.dart';

class NewUserInterface extends ConsumerWidget {
  final TextEditingController searchController;

  const NewUserInterface({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Search for ",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: DefaultColors.black,
            ),
          ),
          const SizedBox(height: 12),

          SearchChipRow(
            titles: ["Mobile Recharge", "Track Billers"],
            icons: [Icons.phone_android, Icons.receipt_long],
          ),
          const SizedBox(height: 12),

          SearchChipRow(
            titles: ["Credit Card Bills", "Offers"],
            icons: [Icons.credit_card, Icons.local_offer],
          ),
          const SizedBox(height: 12),

          SearchChipItem(
            title: "Your Cheque Book",
            icon: Icons.book,
          ),
          const SizedBox(height: 16),

          Text(
            "What's new?",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: DefaultColors.black,
            ),
          ),
          const SizedBox(height: 16),

          const FeatureContainer(),
        ],
      ),
    );
  }
}