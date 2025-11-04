import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/core/providers/theme_provider.dart';

class RewardsCard extends ConsumerWidget {
  const RewardsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(15)),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark 
            ? const Color(0xFF2A2A2A) 
            : const Color.fromARGB(255, 235, 235, 235),
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: MediaQueryUtils.r(6),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.card_giftcard,
            size: MediaQueryUtils.sp(24),
            color: theme.colorScheme.primary,
          ),

          SizedBox(width: MediaQueryUtils.w(12)),

          Expanded(
            child: Text(
              '0 Reward Points earned',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: MediaQueryUtils.sp(14),
                color: theme.colorScheme.onSurface,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Icon(
            Icons.north_east,
            size: MediaQueryUtils.sp(18),
            color: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}