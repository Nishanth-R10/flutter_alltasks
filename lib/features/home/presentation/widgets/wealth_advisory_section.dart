import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/providers/theme_provider.dart';

class WealthAdvisorySection extends ConsumerWidget {
  const WealthAdvisorySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Wealth Advisory',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface,
              ),
            ),
            InkWell(
              onTap: () {
                // Handle Learn More tap
              },
              child: Row(
                children: [
                  Text(
                    'Learn More',
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.north_east,
                    size: screenWidth * 0.04,
                    color: theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: screenHeight * 0.02),

        // Two cards in a row
        Row(
          children: [
            _buildAdvisoryCard(context, ref,
              icon: Icons.work_outline,
              title: 'Portfolio\nManagement',
            ),
            SizedBox(width: screenWidth * 0.04),
            _buildAdvisoryCard(context, ref,
              icon: Icons.savings_outlined,
              title: 'Mutual\nFunds',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdvisoryCard(BuildContext context, WidgetRef ref,
      {required IconData icon, required String title}) {
    final theme = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top gray section (icon aligned to left)
            Container(
              height: screenHeight * 0.08,
              decoration: BoxDecoration(
                color: theme.brightness == Brightness.dark 
                    ? const Color(0xFF2A2A2A) 
                    : const Color(0xFFECEFF1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.04),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    icon,
                    color: theme.colorScheme.primary,
                    size: screenWidth * 0.08,
                  ),
                ),
              ),
            ),

            // Bottom text section
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.015,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.north_east,
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                    size: screenWidth * 0.04,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}