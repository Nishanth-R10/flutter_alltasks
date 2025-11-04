// lib/features/profile/presentation/profile_screen_parts.dart
part of '../../profile_screen.dart';

extension ProfileScreenParts on _ProfileScreenState {
  void _navigateToHome(BuildContext context) {
    context.replaceRoute(const HomeRoute());
  }

  Widget _buildBody(UserState userState, bool isDark) {
    if (userState.isLoading) {
      return _buildShimmerProfileContent(isDark);
    }

    return userState.userResult.match(
      () => _buildShimmerProfileContent(isDark),
      (result) => result.match(
        (error) => _buildErrorWidget(error, isDark),
        (user) => _buildProfileContent(user, isDark),
      ),
    );
  }

  Widget _buildShimmerProfileContent(bool isDark) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
        child: Column(
          children: [
            const SizedBox(height: AppSizes.s16),
            // Shimmer for profile avatar
            Shimmer.fromColors(
              baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
              highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
              child: CircleAvatar(
                radius: AppSizes.s40,
                backgroundColor: isDark ? Colors.grey[700] : Colors.grey[300],
              ),
            ),
            const SizedBox(height: AppSizes.s16),
            // Shimmer for name
            Shimmer.fromColors(
              baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
              highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
              child: Container(
                width: 150,
                height: 20,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[700] : Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.s8),
            // Shimmer for location and ID
            Shimmer.fromColors(
              baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
              highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
              child: Container(
                width: 200,
                height: 14,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[700] : Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.s16),
            // Shimmer for cards
            Row(
              children: [
                Expanded(
                  child: SettingCard(
                    title: '',
                    fontScale: 14,
                    isLoading: true,
                  ),
                ),
                const SizedBox(width: AppSizes.s16),
                Expanded(
                  child: SettingCard(
                    title: '',
                    fontScale: 14,
                    isLoading: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.s16),
            Row(
              children: [
                Expanded(
                  child: BigCard(
                    title: '',
                    imageAsset: "assets/images/discovery.png",
                    fontScale: 12,
                    isLoading: true,
                  ),
                ),
                const SizedBox(width: AppSizes.s16),
                Expanded(
                  child: BigCard(
                    title: '',
                    imageAsset: "assets/images/discovery.png",
                    fontScale: 12,
                    isLoading: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.s16),
            GroupCard(
              titles: [],
              fontScale: 14,
              isLoading: true,
            ),
            const SizedBox(height: AppSizes.s16),
            SettingCard(
              title: '',
              showCircle: true,
              fontScale: 14,
              isLoading: true,
            ),
            const SizedBox(height: AppSizes.s8),
            SettingCard(
              title: '',
              showCircle: true,
              fontScale: 14,
              isLoading: true,
            ),
            const SizedBox(height: AppSizes.s24),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String error, bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Text(
            'Failed to load user data',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Error: $error',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: isDark ? Colors.grey.shade400 : Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => ref.read(userNotifierProvider.notifier).fetchUser(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4197CB),
              foregroundColor: Colors.white,
            ),
            child: Text('Retry', style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent(UserEntity user, bool isDark) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
        child: Column(
          children: [
            const SizedBox(height: AppSizes.s16),
            CircleAvatar(
              radius: AppSizes.s40,
              backgroundColor: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
              child: Icon(Icons.person, size: 40, color: isDark ? Colors.grey.shade400 : Colors.grey),
            ),
            const SizedBox(height: AppSizes.s8),
            Text(
              user.name,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: AppSizes.s4),
            Text(
              "${user.location} • ${user.id}",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: isDark ? Colors.grey.shade400 : Colors.grey,
              ),
            ),
            // ignore: unnecessary_null_comparison
            if (user.email != null) ...[
              const SizedBox(height: AppSizes.s4),
              Text(
                user.email,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: isDark ? Colors.grey.shade400 : Colors.grey,
                ),
              ),
            ],
            const SizedBox(height: AppSizes.s16),
            Row(
              children: [
                Expanded(
                  child: SettingCard(
                    title: DefaultString.instance.personalInfo,
                    fontScale: 14,
                  ),
                ),
                const SizedBox(width: AppSizes.s16),
                Expanded(
                  child: SettingCard(
                    title: DefaultString.instance.yourIDs,
                    fontScale: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.s16),
            Row(
              children: [
                Expanded(
                  child: BigCard(
                    title: DefaultString.instance.notificationSettings,
                    imageAsset: "assets/images/discovery.png",
                    fontScale: 12,
                  ),
                ),
                const SizedBox(width: AppSizes.s16),
                Expanded(
                  child: BigCard(
                    title: DefaultString.instance.inviteAndEarn,
                    imageAsset: "assets/images/discovery.png",
                    fontScale: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.s16),
            GroupCard(
              titles: [
                DefaultString.instance.securitySettings,
                DefaultString.instance.employmentAndTaxDetails,
                DefaultString.instance.reachUs,
              ],
              fontScale: 14,
            ),
            const SizedBox(height: AppSizes.s16),
            SettingCard(
              title: DefaultString.instance.termsAndConditions,
              showCircle: true,
              fontScale: 14,
            ),
            const SizedBox(height: AppSizes.s8),
            SettingCard(
              title: DefaultString.instance.logout,
              showCircle: true,
              fontScale: 14,
            ),
            const SizedBox(height: AppSizes.s24),
          ],
        ),
      ),
    );
  }
}