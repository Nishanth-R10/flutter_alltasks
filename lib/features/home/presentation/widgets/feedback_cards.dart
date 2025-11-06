import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/providers/theme_provider.dart';

class FeedbackCards extends ConsumerWidget {
  const FeedbackCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        // Rate the App Card
        _buildRateAppCard(context, ref, screenWidth, screenHeight),
        SizedBox(height: screenHeight * 0.02),
        
        // Questions Card
        _buildQuestionsCard(context, ref, screenWidth, screenHeight),
      ],
    );
  }

  Widget _buildRateAppCard(BuildContext context, WidgetRef ref, double screenWidth, double screenHeight) {
    final theme = ref.watch(themeProvider);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark 
            ? const Color(0xFF2A2A2A) 
            : const Color(0xFFFFF9E6),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Love to hear your feedback.',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.onSurface.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  'Rate the App!',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.01),
                      child: Icon(
                        Icons.star,
                        color: const Color(0xFFFFD700),
                        size: screenWidth * 0.08,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Image.asset(
            'assets/images/recommendation.gif',
            width: screenWidth * 0.15,
            height: screenWidth * 0.20,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionsCard(BuildContext context, WidgetRef ref, double screenWidth, double screenHeight) {
    final theme = ref.watch(themeProvider);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark 
            ? const Color(0xFF2A2A2A) 
            : const Color(0xFFECEFF1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Have any Questions?',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.onSurface.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  'Rashid is here to help you',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                InkWell(
                  onTap: () {
                    // Handle get help action
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Get Help',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Icon(
                        Icons.north_east,
                        color: theme.colorScheme.primary,
                        size: screenWidth * 0.04,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Image.asset(
            'assets/images/robot.gif',
            width: screenWidth * 0.15,
            height: screenWidth * 0.20,
          ),
        ],
      ),
    );
  }
}