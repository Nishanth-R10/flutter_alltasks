import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_colors/default_colors.dart';
import '../controller/profile_providers.dart';
import '../widgets/big_card.dart';
import '../widgets/group_card.dart';
import '../widgets/settings_card.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _simulateInitialLoad();
  }

  void _simulateInitialLoad() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 2000));
    if (mounted) setState(() => _isLoading = false);
  }

  void _navigateToHome(BuildContext context) => context.router.pop();

  Widget _buildBody(BuildContext context, Map<String, dynamic> userData) {
    final screenHeight = MediaQuery.of(context).size.height;
    return _isLoading
        ? _buildShimmerProfileContent(screenHeight)
        : _buildProfileContent(context, screenHeight, userData);
  }

  Widget _buildShimmerProfileContent(double screenHeight) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), 
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            Shimmer.fromColors(
              baseColor: DefaultColors.grayE6,
              highlightColor: DefaultColors.white,
              child: const CircleAvatar(
                radius: 40.0, //  fixed radius
                backgroundColor: DefaultColors.grayE6,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Shimmer.fromColors(
              baseColor: DefaultColors.grayE6,
              highlightColor: DefaultColors.white,
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.025,
                decoration: BoxDecoration(
                  color: DefaultColors.grayE6,
                  borderRadius: BorderRadius.circular(4.0), // fixed radius
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Shimmer.fromColors(
              baseColor: DefaultColors.grayE6,
              highlightColor: DefaultColors.white,
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.018,
                decoration: BoxDecoration(
                  color: DefaultColors.grayE6,
                  borderRadius: BorderRadius.circular(4.0), //  fixed radius
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Expanded(
                  child: SettingCard(title: '', fontScale: 14.0, isLoading: true),
                ),
                SizedBox(width: screenHeight * 0.02),
                Expanded(
                  child: SettingCard(title: '', fontScale: 14.0, isLoading: true),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Expanded(
                  child: BigCard(
                    title: '',
                    imageAsset: "assets/images/discovery.png",
                    fontScale: 12.0,
                    isLoading: true,
                  ),
                ),
                SizedBox(width: screenHeight * 0.02),
                Expanded(
                  child: BigCard(
                    title: '',
                    imageAsset: "assets/images/discovery.png",
                    fontScale: 12.0,
                    isLoading: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            GroupCard(titles: [], fontScale: 14.0, isLoading: true),
            SizedBox(height: screenHeight * 0.02),
            SettingCard(title: '', showCircle: true, fontScale: 14.0, isLoading: true),
            SizedBox(height: screenHeight * 0.01),
            SettingCard(title: '', showCircle: true, fontScale: 14.0, isLoading: true),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileContent(
      BuildContext context, double screenHeight, Map<String, dynamic> userData) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // ❌ no MediaQuery
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            CircleAvatar(
              radius: 40.0, // fixed radius
              backgroundColor: DefaultColors.grayE6,
              child: const Icon(Icons.person, size: 40.0, color: DefaultColors.gray82),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              userData["name"],
              style: GoogleFonts.poppins(
                fontSize: 20.0, //  fixed font size
                fontWeight: FontWeight.w800,
                color: DefaultColors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              "${userData["location"]} • ${userData["id"]}",
              style: GoogleFonts.poppins(
                fontSize: 14.0, //  fixed font size
                color: DefaultColors.gray82,
              ),
            ),
            if (userData["email"] != null) ...[
              SizedBox(height: screenHeight * 0.005),
              Text(
                userData["email"],
                style: GoogleFonts.poppins(
                  fontSize: 14.0, // ❌ fixed font size
                  color: DefaultColors.gray82,
                ),
              ),
            ],
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Expanded(
                  child: SettingCard(title: "personalInfo", fontScale: 14.0),
                ),
                SizedBox(width: screenWidth * 0.04),
                Expanded(
                  child: SettingCard(title: "yourIDs", fontScale: 14.0),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Expanded(
                  child: BigCard(
                    title: "notificationSettings",
                    imageAsset: "assets/images/discovery.png",
                    fontScale: 12.0,
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),
                Expanded(
                  child: BigCard(
                    title: "inviteAndEarn",
                    imageAsset: "assets/images/discovery.png",
                    fontScale: 12.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            GroupCard(
              titles: ["securitySettings", "employmentAndTaxDetails", "reachUs"],
              fontScale: 14.0,
            ),
            SizedBox(height: screenHeight * 0.02),
            SettingCard(title: "termsAndConditions", showCircle: true, fontScale: 14.0),
            SizedBox(height: screenHeight * 0.01),
            SettingCard(title: "logout", showCircle: true, fontScale: 14.0),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(staticUserDataProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: DefaultColors.whiteF3,
      appBar: AppBar(
        backgroundColor: DefaultColors.whiteF3,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DefaultColors.black),
          onPressed: () => _navigateToHome(context),
        ),
        title: Text(
          "profile",
          style: GoogleFonts.poppins(
            color: DefaultColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.0, //  fixed font size
          ),
        ),
      ),
      body: _buildBody(context, userData),
    );
  }
}
