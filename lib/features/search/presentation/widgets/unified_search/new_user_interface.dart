// lib/features/search/presentation/widgets/unified_search/new_user_interface.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/search/presentation/widgets/financial_services/feature_container.dart';
import 'package:tasks/features/search/presentation/widgets/new_user_search/search_chip_item.dart';
import 'package:tasks/features/search/presentation/widgets/new_user_search/search_chip_row.dart';

class NewUserInterface extends ConsumerWidget {
  final TextEditingController searchController;

  const NewUserInterface({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryUtils.init(context);
    
    
    final sectionTitle = "What's new?"; 

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DefaultString.instance.searchFor,
            style: GoogleFonts.poppins(
              fontSize: MediaQueryUtils.sp(16),
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 7, 7, 7),
            ),
          ),
          SizedBox(height: MediaQueryUtils.h(8)),

          SearchChipRow(
            titles: [DefaultString.instance.mobileRecharge, DefaultString.instance.trackBillers],
            icons: [Icons.phone_android, Icons.receipt_long],
          ),
          SizedBox(height: MediaQueryUtils.h(12)),

          SearchChipRow(
            titles: [DefaultString.instance.creditCardBills, DefaultString.instance.offersSearch],
            icons: [Icons.credit_card, Icons.local_offer],
          ),
          SizedBox(height: MediaQueryUtils.h(12)),

          SearchChipItem(
            title: DefaultString.instance.yourChequeBook,
            icon: Icons.book,
          ),
          SizedBox(height: MediaQueryUtils.h(16)),

          Text(
            sectionTitle, 
            style: GoogleFonts.poppins(
              fontSize: MediaQueryUtils.sp(16),
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 7, 7, 7),
            ),
          ),
          SizedBox(height: MediaQueryUtils.h(16)),

          const FeatureContainerRow(),
        ],
      ),
    );
  }
}