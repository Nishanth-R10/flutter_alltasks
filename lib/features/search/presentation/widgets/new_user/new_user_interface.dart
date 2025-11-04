import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/search/presentation/widgets/financial_services/feature_container.dart';
import 'package:tasks/features/search/presentation/widgets/new_user/search_chip_item.dart';
import 'package:tasks/features/search/presentation/widgets/new_user/search_chip_row.dart';


class NewUserInterface extends ConsumerWidget {
  final TextEditingController searchController;
  const NewUserInterface({super.key, required this.searchController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    MediaQueryUtils.init(context);
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(DefaultString.instance.searchFor, isDark),
          SizedBox(height: MediaQueryUtils.h(8)),
          SearchChipRow(titles: [DefaultString.instance.mobileRecharge, DefaultString.instance.trackBillers], icons: [Icons.phone_android, Icons.receipt_long]),
          SizedBox(height: MediaQueryUtils.h(12)),
          SearchChipRow(titles: [DefaultString.instance.creditCardBills, DefaultString.instance.offersSearch], icons: [Icons.credit_card, Icons.local_offer]),
          SizedBox(height: MediaQueryUtils.h(12)),
          SearchChipItem(title: DefaultString.instance.yourChequeBook, icon: Icons.book),
          SizedBox(height: MediaQueryUtils.h(16)),
          _buildSectionTitle("What's new?", isDark),
          SizedBox(height: MediaQueryUtils.h(16)),
          const FeatureContainerRow(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Text(title, style: GoogleFonts.poppins(
      fontSize: MediaQueryUtils.sp(16),
      fontWeight: FontWeight.w600,
      color: isDark ? Colors.white : const Color.fromARGB(255, 7, 7, 7),
    ));
  }
}