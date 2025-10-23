// lib/features/profile/presentation/profile_screen_parts.dart
part of '../../profile_screen.dart';

extension ProfileScreenParts on _ProfileScreenState {
  void _navigateToHome(BuildContext context) {
    context.replaceRoute(const HomeRoute());
  }

  Widget _buildBody(UserState userState) {
    if (userState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return userState.userResult.match(
      () => const Center(child: CircularProgressIndicator()),
      (result) => result.match(
        (error) => _buildErrorWidget(error),
        (user) => _buildProfileContent(user),
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
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
              color: Colors.grey,
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

  Widget _buildProfileContent(UserEntity user) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
        child: Column(
          children: [
            const SizedBox(height: AppSizes.s16),
            CircleAvatar(
              radius: AppSizes.s40,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.person, size: 40, color: Colors.grey),
            ),
            const SizedBox(height: AppSizes.s8),
            Text(
              user.name,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: AppSizes.s4),
            Text(
              "${user.location} • ${user.id}",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            // ignore: unnecessary_null_comparison
            if (user.email != null) ...[
              const SizedBox(height: AppSizes.s4),
              Text(
                user.email,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey,
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