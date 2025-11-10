// lib/features/search/presentation/widgets/new_user_interface.dart
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
    final baseSize = MediaQuery.of(context).size.shortestSide * 0.01;
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Search for ",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4,
              fontWeight: FontWeight.w600,
              color: DefaultColors.black,
            ),
          ),
          SizedBox(height: baseSize * 3),

          SearchChipRow(
            titles: ["Mobile Recharge", "Track Billers"],
            icons: [Icons.phone_android, Icons.receipt_long],
          ),
          SizedBox(height: baseSize * 3),

          SearchChipRow(
            titles: ["Credit Card Bills", "Offers"],
            icons: [Icons.credit_card, Icons.local_offer],
          ),
          SizedBox(height: baseSize * 3),

          SearchChipItem(
            title: "Your Cheque Book",
            icon: Icons.book,
          ),
          SizedBox(height: baseSize * 4),

          Text(
            "What's new?",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 4,
              fontWeight: FontWeight.w600,
              color: DefaultColors.black,
            ),
          ),
          SizedBox(height: baseSize * 4),

          const FeatureContainer(),
        ],
      ),
    );
  }
}