import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks/core/constants/app_colors/default_colors.dart';
import 'package:tasks/features/profile/presentation/controller/profile_providers.dart';
import 'package:tasks/features/profile/presentation/widgets/settings_card.dart';
import 'package:tasks/features/profile/presentation/widgets/group_card.dart';
import 'package:tasks/features/profile/presentation/widgets/big_card.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _isLoading = true; // LOCAL STATE instead of Riverpod provider

  @override
  void initState() {
    super.initState();
    _simulateInitialLoad();
  }

  void _simulateInitialLoad() async {
    print('🔄 Starting profile load...');
    
    setState(() => _isLoading = true);
    
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 2000));
    
    if (mounted) {
      setState(() => _isLoading = false);
      print('✅ Profile load complete');
    }
  }

  void _navigateToHome(BuildContext context) {
    // Use AutoRouter for consistent navigation
    context.router.pop();
  }

  Widget _buildBody(BuildContext context, Map<String, dynamic> userData) {
    print('🏗️ Building body with isLoading: $_isLoading');
    
    if (_isLoading) {
      return _buildShimmerProfileContent(context);
    }
    return _buildProfileContent(context, userData);
  }

  Widget _buildShimmerProfileContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            Shimmer.fromColors(
              baseColor: DefaultColors.grayE6,
              highlightColor: DefaultColors.white,
              child: CircleAvatar(
                radius: 40.0,
                backgroundColor: DefaultColors.grayE6,
              ),
            ),
            const SizedBox(height: 16.0),
            Shimmer.fromColors(
              baseColor: DefaultColors.grayE6,
              highlightColor: DefaultColors.white,
              child: Container(
                width: 150.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: DefaultColors.grayE6,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Shimmer.fromColors(
              baseColor: DefaultColors.grayE6,
              highlightColor: DefaultColors.white,
              child: Container(
                width: 200.0,
                height: 14.0,
                decoration: BoxDecoration(
                  color: DefaultColors.grayE6,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: SettingCard(title: '', fontScale: 14.0, isLoading: true),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: SettingCard(title: '', fontScale: 14.0, isLoading: true),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: BigCard(title: '', imageAsset: "assets/images/discovery.png", fontScale: 12.0, isLoading: true),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: BigCard(title: '', imageAsset: "assets/images/discovery.png", fontScale: 12.0, isLoading: true),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            GroupCard(titles: [], fontScale: 14.0, isLoading: true),
            const SizedBox(height: 16.0),
            SettingCard(title: '', showCircle: true, fontScale: 14.0, isLoading: true),
            const SizedBox(height: 8.0),
            SettingCard(title: '', showCircle: true, fontScale: 14.0, isLoading: true),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, Map<String, dynamic> userData) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            CircleAvatar(
              radius: 40.0,
              backgroundColor: DefaultColors.grayE6,
              child: Icon(Icons.person, size: 40.0, color: DefaultColors.gray82),
            ),
            const SizedBox(height: 8.0),
            Text(
              userData["name"],
              style: GoogleFonts.poppins(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
                color: DefaultColors.black,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              "${userData["location"]} • ${userData["id"]}",
              style: GoogleFonts.poppins(
                fontSize: 14.0,
                color: DefaultColors.gray82,
              ),
            ),
            if (userData["email"] != null) ...[
              const SizedBox(height: 4.0),
              Text(
                userData["email"],
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  color: DefaultColors.gray82,
                ),
              ),
            ],
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: SettingCard(title: "personalInfo", fontScale: 14.0),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: SettingCard(title: "yourIDs", fontScale: 14.0),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: BigCard(title: "notificationSettings", imageAsset: "assets/images/discovery.png", fontScale: 12.0),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: BigCard(title: "inviteAndEarn", imageAsset: "assets/images/discovery.png", fontScale: 12.0),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            GroupCard(
              titles: ["securitySettings", "employmentAndTaxDetails", "reachUs"],
              fontScale: 14.0,
            ),
            const SizedBox(height: 16.0),
            SettingCard(title: "termsAndConditions", showCircle: true, fontScale: 14.0),
            const SizedBox(height: 8.0),
            SettingCard(title: "logout", showCircle: true, fontScale: 14.0),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(staticUserDataProvider);
    
    print('📱 ProfileScreen build - isLoading: $_isLoading');
    
    return Scaffold(
      backgroundColor: DefaultColors.whiteF3,
      appBar: AppBar(
        backgroundColor: DefaultColors.whiteF3,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: DefaultColors.black),
          onPressed: () => _navigateToHome(context),
        ),
        title: Text(
          "profile",
          style: GoogleFonts.poppins(
            color: DefaultColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _buildBody(context, userData),
    );
  }
}