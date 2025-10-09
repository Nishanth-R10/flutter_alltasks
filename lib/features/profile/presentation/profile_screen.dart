import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/features/profile/domain/entities/user.dart';
import 'package:tasks/features/profile/presentation/app_size.dart';
import 'package:tasks/features/profile/presentation/controller/app_providers.dart';
import 'package:tasks/features/profile/presentation/widgets/settings_card.dart';
import 'package:tasks/features/profile/presentation/widgets/group_card.dart';
import 'package:tasks/features/profile/presentation/widgets/big_card.dart';
import '../domain/entities/user_state.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userNotifierProvider.notifier).fetchUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);
    
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          DefaultString.instance.profile,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: userState is UserLoading 
          ? const Center(child: CircularProgressIndicator())
          : userState is UserError
            ? Center(child: Text('Error: ${userState.message}'))
            : userState is UserLoaded 
              ? _buildProfileContent(userState.user)
              : const SizedBox(),
    );
  }

  Widget _buildProfileContent(User user) {
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
            const SizedBox(height: AppSizes.s16),

            Row(
              children: [
                Expanded(child: SettingCard(title: DefaultString.instance.personalInfo, fontScale: 14)),
                const SizedBox(width: AppSizes.s16),
                Expanded(child: SettingCard(title: DefaultString.instance.yourIDs, fontScale: 14)),
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

            GroupCard(titles: [DefaultString.instance.securitySettings, DefaultString.instance.employmentAndTaxDetails, DefaultString.instance.reachUs], fontScale: 14),
            const SizedBox(height: AppSizes.s16),

            SettingCard(title: DefaultString.instance.termsAndConditions, showCircle: true, fontScale: 14),
            const SizedBox(height: AppSizes.s8),
            SettingCard(title: DefaultString.instance.logout, showCircle: true, fontScale: 14),
            const SizedBox(height: AppSizes.s24),
          ],
        ),
      ),
    );
  }
}