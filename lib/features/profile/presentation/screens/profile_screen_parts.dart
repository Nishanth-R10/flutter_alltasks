// part of 'profile_screen.dart';

// extension ProfileScreenParts on _ProfileScreenState {
//   void _navigateToHome(BuildContext context) {
//     context.replaceRoute(const HomeRoute());
//   }

//   Widget _buildBody(UserState userState, bool isDark) {
//     if (userState.isLoading) {
//       return _buildShimmerProfileContent(isDark);
//     }

//     return userState.userResult.match(
//       () => _buildShimmerProfileContent(isDark),
//       (result) => result.match(
//         (error) => _buildErrorWidget(error, isDark),
//         (user) => _buildProfileContent(user, isDark),
//       ),
//     );
//   }

//   Widget _buildShimmerProfileContent(bool isDark) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             const SizedBox(height: 16.0),
//             // Shimmer for profile avatar
//             Shimmer.fromColors(
//               baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
//               highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
//               child: CircleAvatar(
//                 radius: 40.0,
//                 backgroundColor: isDark ? Colors.grey[700] : Colors.grey[300],
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             // Shimmer for name
//             Shimmer.fromColors(
//               baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
//               highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
//               child: Container(
//                 width: 150.0,
//                 height: 20.0,
//                 decoration: BoxDecoration(
//                   color: isDark ? Colors.grey[700] : Colors.white,
//                   borderRadius: BorderRadius.circular(4.0),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             // Shimmer for location and ID
//             Shimmer.fromColors(
//               baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
//               highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
//               child: Container(
//                 width: 200.0,
//                 height: 14.0,
//                 decoration: BoxDecoration(
//                   color: isDark ? Colors.grey[700] : Colors.white,
//                   borderRadius: BorderRadius.circular(4.0),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             // Shimmer for cards
//             Row(
//               children: [
//                 Expanded(
//                   child: SettingCard(
//                     title: '',
//                     fontScale: 14.0,
//                     isLoading: true,
//                   ),
//                 ),
//                 const SizedBox(width: 16.0),
//                 Expanded(
//                   child: SettingCard(
//                     title: '',
//                     fontScale: 14.0,
//                     isLoading: true,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16.0),
//             Row(
//               children: [
//                 Expanded(
//                   child: BigCard(
//                     title: '',
//                     imageAsset: "assets/images/discovery.png",
//                     fontScale: 12.0,
//                     isLoading: true,
//                   ),
//                 ),
//                 const SizedBox(width: 16.0),
//                 Expanded(
//                   child: BigCard(
//                     title: '',
//                     imageAsset: "assets/images/discovery.png",
//                     fontScale: 12.0,
//                     isLoading: true,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16.0),
//             GroupCard(
//               titles: [],
//               fontScale: 14.0,
//               isLoading: true,
//             ),
//             const SizedBox(height: 16.0),
//             SettingCard(
//               title: '',
//               showCircle: true,
//               fontScale: 14.0,
//               isLoading: true,
//             ),
//             const SizedBox(height: 8.0),
//             SettingCard(
//               title: '',
//               showCircle: true,
//               fontScale: 14.0,
//               isLoading: true,
//             ),
//             const SizedBox(height: 24.0),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildErrorWidget(String error, bool isDark) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.error_outline, color: Colors.red, size: 48.0),
//           const SizedBox(height: 16.0),
//           Text(
//             'Failed to load user data',
//             style: GoogleFonts.poppins(
//               fontSize: 16.0,
//               color: Colors.red,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             'Error: $error',
//             style: GoogleFonts.poppins(
//               fontSize: 12.0,
//               color: isDark ? Colors.grey.shade400 : Colors.grey,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16.0),
//           ElevatedButton(
//             onPressed: () => ref.read(userNotifierProvider.notifier).fetchUser(),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF4197CB),
//               foregroundColor: Colors.white,
//             ),
//             child: Text('Retry', style: GoogleFonts.poppins()),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProfileContent(UserEntity user, bool isDark) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             const SizedBox(height: 16.0),
//             CircleAvatar(
//               radius: 40.0,
//               backgroundColor: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
//               child: Icon(Icons.person, size: 40.0, color: isDark ? Colors.grey.shade400 : Colors.grey),
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               user.name,
//               style: GoogleFonts.poppins(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.w800,
//                 color: isDark ? Colors.white : Colors.black,
//               ),
//             ),
//             const SizedBox(height: 4.0),
//             Text(
//               "${user.location} • ${user.id}",
//               style: GoogleFonts.poppins(
//                 fontSize: 14.0,
//                 color: isDark ? Colors.grey.shade400 : Colors.grey,
//               ),
//             ),
//             if (user.email != null) ...[
//               const SizedBox(height: 4.0),
//               Text(
//                 user.email,
//                 style: GoogleFonts.poppins(
//                   fontSize: 14.0,
//                   color: isDark ? Colors.grey.shade400 : Colors.grey,
//                 ),
//               ),
//             ],
//             const SizedBox(height: 16.0),
//             Row(
//               children: [
//                 Expanded(
//                   child: SettingCard(
//                     title: "personalInfo",
//                     fontScale: 14.0,
//                   ),
//                 ),
//                 const SizedBox(width: 16.0),
//                 Expanded(
//                   child: SettingCard(
//                     title: "yourIDs",
//                     fontScale: 14.0,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16.0),
//             Row(
//               children: [
//                 Expanded(
//                   child: BigCard(
//                     title: "notificationSettings",
//                     imageAsset: "assets/images/discovery.png",
//                     fontScale: 12.0,
//                   ),
//                 ),
//                 const SizedBox(width: 16.0),
//                 Expanded(
//                   child: BigCard(
//                     title: "inviteAndEarn",
//                     imageAsset: "assets/images/discovery.png",
//                     fontScale: 12.0,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16.0),
//             GroupCard(
//               titles: [
//                 "securitySettings",
//                 "employmentAndTaxDetails",
//                 "reachUs",
//               ],
//               fontScale: 14.0,
//             ),
//             const SizedBox(height: 16.0),
//             SettingCard(
//               title:" termsAndConditions",
//               showCircle: true,
//               fontScale: 14.0,
//             ),
//             const SizedBox(height: 8.0),
//             SettingCard(
//               title: "logout",
//               showCircle: true,
//               fontScale: 14.0,
//             ),
//             const SizedBox(height: 24.0),
//           ],
//         ),
//       ),
//     );
//   }
// }