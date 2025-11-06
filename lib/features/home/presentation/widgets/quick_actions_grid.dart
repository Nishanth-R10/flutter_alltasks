import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/core/providers/theme_provider.dart';
import 'package:tasks/features/home/presentation/widgets/gradient_border_painter.dart';

class QuickActionsGrid extends ConsumerWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    MediaQueryUtils.init(context);
    
    return Stack(
      children: [
        _buildGridContainer(ref),
        _buildGradientBorder(),
      ],
    );
  }

  Widget _buildGridContainer(WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    
    return Container(
      width: MediaQueryUtils.w(343),
      height: MediaQueryUtils.h(92),
      padding: EdgeInsets.all(MediaQueryUtils.w(12)),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark 
            ? const Color(0xFF2A2A2A) 
            : const Color.fromARGB(255, 235, 235, 235),
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(16)),
        border: Border.all(
          color: theme.dividerColor!,
          width: MediaQueryUtils.w(1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: MediaQueryUtils.r(8),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _actionButton(ref, icon: Icons.swap_horiz, label: DefaultString.instance.transfer),
          _actionButton(ref, icon: Icons.list, label: DefaultString.instance.request),
          _actionButton(ref, icon: Icons.trending_up, label: DefaultString.instance.stocks),
          _actionButton(ref, icon: Icons.auto_awesome, label: DefaultString.instance.products),
        ],
      ),
    );
  }

  Widget _buildGradientBorder() {
    return Positioned(
      top: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(MediaQueryUtils.r(16)),
        ),
        child: CustomPaint(
          size: Size(MediaQueryUtils.w(100), MediaQueryUtils.h(92)),
          painter: GradientBorderPainter(
            borderRadius: MediaQueryUtils.r(16),
            strokeWidth: MediaQueryUtils.w(2.5),
          ),
        ),
      ),
    );
  }

  Widget _actionButton(WidgetRef ref, {required IconData icon, required String label}) {
    final theme = ref.watch(themeProvider);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQueryUtils.w(48),
          height: MediaQueryUtils.w(48),
          decoration: BoxDecoration(
            color: theme.brightness == Brightness.dark 
                ? const Color(0xFF3A3A3A) 
                : const Color(0xFFF3F6FF),
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
          ),
          child: Center(
            child: Icon(
              icon,
              size: MediaQueryUtils.sp(24),
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(4)),
        SizedBox(
          width: MediaQueryUtils.w(58),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Diodrum Arabic',
              fontWeight: FontWeight.w500,
              fontSize: MediaQueryUtils.sp(11),
              height: 1.2,
              letterSpacing: 0,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}