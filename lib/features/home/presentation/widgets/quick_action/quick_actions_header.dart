import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/core/providers/theme_provider.dart';

class QuickActionsHeader extends ConsumerWidget {
  const QuickActionsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    MediaQueryUtils.init(context);
    
    return SizedBox(
      width: MediaQueryUtils.w(343),
      height: MediaQueryUtils.h(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DefaultString.instance.quickActions,
            style: GoogleFonts.dmSans(
              fontSize: MediaQueryUtils.sp(19),
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
              letterSpacing: 0,
              height: 1.2,
            ),
          ),
          _buildCustomizeButton(context, ref),
        ],
      ),
    );
  }

  Widget _buildCustomizeButton(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQueryUtils.w(12),
        vertical: MediaQueryUtils.h(6),
      ),
      child: Row(
        children: [
          Text(
            DefaultString.instance.customize,
            style: TextStyle(
              fontFamily: 'Diodrum Arabic',
              fontWeight: FontWeight.w600,
              fontSize: MediaQueryUtils.sp(12),
              color: theme.colorScheme.primary,
              height: 1.2,
              letterSpacing: 0,
            ),
          ),
          SizedBox(width: MediaQueryUtils.w(4)),
          Icon(
            Icons.north_east,
            size: MediaQueryUtils.sp(12),
            color: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}