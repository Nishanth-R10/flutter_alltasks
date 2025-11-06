// lib/features/home/presentation/pages/home_screen_navigation.dart
part of 'home_screen.dart';

extension HomeScreenNavigation on HomeScreenState {
  Widget _buildNavigationSection(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQueryUtils.w(343),
          height: MediaQueryUtils.h(24),
          child: Text(
            DefaultString.instance.navigateToFeatures,
            style: GoogleFonts.poppins(
              fontSize: MediaQueryUtils.sp(19),
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(12)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _navigationButton(
                context: context,
                title: DefaultString.instance.search,
                icon: Icons.search,
                onTap: () => context.pushRoute(const UnifiedSearchRoute()),
                isDark: isDark,
              ),
            ),
            SizedBox(width: MediaQueryUtils.w(12)),
            Expanded(
              child: _navigationButton(
                context: context,
                title: DefaultString.instance.profile,
                icon: Icons.person,
                onTap: () => context.pushRoute(const ProfileRoute()),
                isDark: isDark,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _navigationButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(MediaQueryUtils.w(16)),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF2A2A2A) : const Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: MediaQueryUtils.r(6),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: MediaQueryUtils.sp(24), color: Colors.blue),
            SizedBox(height: MediaQueryUtils.h(8)),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: MediaQueryUtils.sp(14),
                color: isDark ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}