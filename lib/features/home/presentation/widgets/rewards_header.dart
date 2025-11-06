import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/core/providers/theme_provider.dart';

class RewardsHeader extends ConsumerWidget {
  const RewardsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    
    return SizedBox(
      width: MediaQueryUtils.w(343),
      height: MediaQueryUtils.h(32),
      child: Text(
        DefaultString.instance.rewards,
        style: GoogleFonts.dmSans(
          fontSize: MediaQueryUtils.sp(19),
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
          letterSpacing: 0,
          height: 1.2,
        ),
      ),
    );
  }
}