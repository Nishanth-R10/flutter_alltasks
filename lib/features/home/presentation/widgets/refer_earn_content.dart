import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/core/providers/theme_provider.dart';

class ReferEarnContent extends ConsumerWidget {
  const ReferEarnContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    MediaQueryUtils.init(context);
    
    return Stack(
      clipBehavior: Clip.none, 
      children: [
        _buildContentCard(context, ref),
        _buildGiftImage(),
      ],
    );
  }

  Widget _buildContentCard(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(9)),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark 
            ? const Color(0xFF2A2A2A) 
            : const Color.fromARGB(255, 202, 208, 245),
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03), 
            blurRadius: MediaQueryUtils.r(8)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQueryUtils.w(220),
            child: _buildDescription(ref),
          ),
          SizedBox(height: MediaQueryUtils.h(12)),
          _buildReferralCodeSection(ref),
        ],
      ),
    );
  }

  Widget _buildDescription(WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    
    return SizedBox(
      width: MediaQueryUtils.w(220),
      child: Column(
        children: [
          Text(  
            DefaultString.instance.inviteFriends,
            style: TextStyle(
              fontFamily: 'Diodrum Arabic',
              fontWeight: FontWeight.w600,
              fontSize: MediaQueryUtils.sp(15),
              height: 1.3,
              letterSpacing: 0,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReferralCodeSection(WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildReferralCode(ref),
      ],
    );
  }

  Widget _buildReferralCode(WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(
            DefaultString.instance.yourReferralCode,
            style: TextStyle(
              fontFamily: 'Diodrum Arabic',
              fontWeight: FontWeight.w500,
              fontSize: MediaQueryUtils.sp(12),
              height: 1.2,
              letterSpacing: 0,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              '',
              style: GoogleFonts.poppins(
                fontSize: MediaQueryUtils.sp(14),
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),  
      ],
    );
  }

  Widget _buildGiftImage() {
    return Positioned(
      top: MediaQueryUtils.h(-35),  
      right: MediaQueryUtils.w(-40), 
      child: Image.asset(
        'assets/images/gift.png',
        width: MediaQueryUtils.w(200), 
        height: MediaQueryUtils.h(100), 
      ),
    );
  }
}