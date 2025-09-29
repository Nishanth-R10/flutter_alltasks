
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/profile/domain/entities/user.dart';
import 'package:tasks/features/profile/presentation/app_size.dart';
import 'package:tasks/features/profile/presentation/controller/app_providers.dart';
import 'package:tasks/features/profile/presentation/widgets/settings_card.dart';

import 'widgets/group_card.dart';
import 'widgets/big_card.dart';
import '../domain/entities/user_state.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch user data when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userNotifierProvider.notifier).fetchUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);
    
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: userState is UserLoading 
          ? const Center(child: CircularProgressIndicator())
          : userState is UserError
            ? Center(child: Text('Error: ${userState.message}'))
            : userState is UserLoaded 
              ? _buildProfileContent(userState.user)
              : const SizedBox(), // Initial state
      ),
    );
  }

  Widget _buildProfileContent(User user) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, size: 24),
                onPressed: () {},
              ),
            ),
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

            // Row 1: Small Cards
            Row(
              children: [
                Expanded(child: SettingCard(title: "Personal Info", fontScale: 14)),
                const SizedBox(width: AppSizes.s16),
                Expanded(child: SettingCard(title: "Your IDs", fontScale: 14)),
              ],
            ),
            const SizedBox(height: AppSizes.s16),

            // Row 2: Big Cards
            Row(
              children: [
                Expanded(
                  child: BigCard(
                    title: "Notification Settings",
                    imageAsset: "assets/images/discovery.png",
                    fontScale: 12,
                  ),
                ),
                const SizedBox(width: AppSizes.s16),
                Expanded(
                  child: BigCard(
                    title: "Invite and Earn",
                    imageAsset: "assets/images/discovery.png",
                    fontScale: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.s16),

            // Group Cards
            GroupCard(titles: ["Security Settings", "Employment and Tax Details", "Reach Us"], fontScale: 14),
            const SizedBox(height: AppSizes.s16),

            // Other single cards
            SettingCard(title: "Terms and Conditions", showCircle: true, fontScale: 14),
            const SizedBox(height: AppSizes.s8),
            SettingCard(title: "Logout", showCircle: true, fontScale: 14),
            const SizedBox(height: AppSizes.s24),
          ],
        ),
      ),
    );
  }
}