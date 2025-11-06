// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tasks/core/utils/media_query_utils.dart';
// import 'package:tasks/features/home/application/referral_provider.dart';
// import 'package:tasks/features/home/domain/entities/referral_entity.dart';
// import 'package:tasks/features/home/presentation/widgets/offer_section/shrimmer/shimmer_widget.dart';

// class ReferEarnSection extends ConsumerWidget {
//   const ReferEarnSection({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     MediaQueryUtils.init(context);
//    // final referralAsync = ref.watch(referralFutureProvider);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Header outside container
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: MediaQueryUtils.w(15)),
//           child: Text(
//             'Refer & Earn',
//             style: GoogleFonts.dmSans(
//               fontSize: MediaQueryUtils.sp(19),
//               fontWeight: FontWeight.w600,
//               color: Colors.black,
//               letterSpacing: 0,
//               height: 1.2,
//             ),
//           ),
//         ),
//         SizedBox(height: MediaQueryUtils.h(12)),
//         // referralAsync.when(
//         //   loading: () => _buildReferralShimmer(),
//         //   error: (error, stack) => _buildReferralError(error, ref),
//         //   data: (referral) => _buildReferralCard(referral),
//         // ),
//       ],
//     );
//   }

//   Widget _buildReferralCard(ReferralEntity referral) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: MediaQueryUtils.w(15)),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           _buildContentCard(referral),
//           //_buildGiftBadge(),
//         ],
//       ),
//     );
//   }

//   Widget _buildContentCard(ReferralEntity referral) {
//     return Container(
//       padding: EdgeInsets.all(MediaQueryUtils.w(15)),
//       decoration: BoxDecoration(
//         color: const Color(0xFFD6EAF8), // Light blue background
//         borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: MediaQueryUtils.r(8),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Description with width constraint to prevent overlap
//           SizedBox(
//             width: MediaQueryUtils.w(300),
//             child: Column(  
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Help your friends grow\ntheir wealth',
//                   style: GoogleFonts.poppins(
//                     fontWeight: FontWeight.w600,
//                     fontSize: MediaQueryUtils.sp(15),
//                     height: 1.3,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: MediaQueryUtils.h(8)),
//                 Text(
//                   'A successful referral earns you ${referral.rewardPoints} points.',
//                   style: GoogleFonts.poppins(
//                     fontWeight: FontWeight.w400,
//                     fontSize: MediaQueryUtils.sp(12),
//                     height: 1.3,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildReferralCodeSection(ReferralEntity referral) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildReferralCode(referral),
//         _buildShareButton(),
//       ],
//     );
//   }

//   Widget _buildReferralCode(ReferralEntity referral) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: MediaQueryUtils.w(100),
//           child: Text(
//             'Your Referral Code',
//             textAlign: TextAlign.start,
//             style: TextStyle(
//               fontFamily: 'Diodrum Arabic',
//               fontWeight: FontWeight.w500,
//               fontSize: MediaQueryUtils.sp(12),
//               height: 1.2,
//               letterSpacing: 0,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         SizedBox(height: MediaQueryUtils.h(6)),
//         Row(
//           children: [
//             Text(
//               referral.referralCode,
//               style: GoogleFonts.poppins(
//                 fontSize: MediaQueryUtils.sp(14),
//                 fontWeight: FontWeight.w600,
//                 letterSpacing: 1.5,
//               ),
//             ),
//             SizedBox(width: MediaQueryUtils.w(6)),
//             Icon(
//               Icons.copy,
//               size: MediaQueryUtils.sp(18),
//               color: const Color(0xFF4197CB),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildShareButton() {
//     return TextButton(
//       onPressed: () {},
//       style: TextButton.styleFrom(
//         padding: EdgeInsets.symmetric(
//           horizontal: MediaQueryUtils.w(8),
//           vertical: MediaQueryUtils.h(4),
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'Share Link',
//             style: GoogleFonts.poppins(
//               color: const Color(0xFF4197CB),
//               fontWeight: FontWeight.w600,
//               fontSize: MediaQueryUtils.sp(13),
//             ),
//           ),
//           SizedBox(width: MediaQueryUtils.w(4)),
//           Icon(
//             Icons.share,
//             color: Color(0xFF4197CB),
//             size: MediaQueryUtils.sp(18),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildGiftImage() {
//     return Positioned(
//       top: MediaQueryUtils.h(10),
//       right: MediaQueryUtils.w(15),
//       child: Container(
//         width: MediaQueryUtils.w(90),
//         height: MediaQueryUtils.h(90),
//         decoration: BoxDecoration(
//           color: Color(0xFF5DADE2), // Blue badge color
//           borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.card_giftcard,
//               size: MediaQueryUtils.w(36),
//               color: Colors.white,
//             ),
//             SizedBox(height: MediaQueryUtils.h(4)),
//             Text(
//               'REFER\n& EARN',
//               textAlign: TextAlign.center,
//               style: GoogleFonts.poppins(
//                 fontSize: MediaQueryUtils.sp(10),
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 height: 1.1,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildReferralShimmer() {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: MediaQueryUtils.w(10)),
//       child: ShimmerWidget(
//         child: Container(
//           padding: EdgeInsets.all(MediaQueryUtils.w(15)),
//           decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: MediaQueryUtils.w(200),
//                 height: MediaQueryUtils.h(14),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[400],
//                   borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
//                 ),
//               ),
//               SizedBox(height: MediaQueryUtils.h(12)),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: MediaQueryUtils.w(100),
//                         height: MediaQueryUtils.h(12),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[400],
//                           borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
//                         ),
//                       ),
//                       SizedBox(height: MediaQueryUtils.h(6)),
//                       Container(
//                         width: MediaQueryUtils.w(120),
//                         height: MediaQueryUtils.h(14),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[400],
//                           borderRadius: BorderRadius.circular(MediaQueryUtils.r(4)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     width: MediaQueryUtils.w(100),
//                     height: MediaQueryUtils.h(40),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[400],
//                       borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildReferralError(Object error, WidgetRef ref) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: MediaQueryUtils.w(15)),
//       padding: EdgeInsets.all(MediaQueryUtils.w(16)),
//       decoration: BoxDecoration(
//         color: Colors.red[50],
//         borderRadius: BorderRadius.circular(MediaQueryUtils.r(16)),
//         border: Border.all(color: Colors.red.shade200),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Icon(Icons.error_outline, color: Colors.red, size: MediaQueryUtils.w(20)),
//               SizedBox(width: MediaQueryUtils.w(12)),
//               Expanded(
//                 child: Text(
//                   'Failed to load referral details',
//                   style: GoogleFonts.poppins(
//                     fontSize: MediaQueryUtils.sp(14),
//                     color: Colors.red,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: MediaQueryUtils.h(12)),
//           ElevatedButton(
//             onPressed: () {
//              // ref.invalidate(referralFutureProvider);
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red,
//               foregroundColor: Colors.white,
//             ),
//             child: Text('Retry'),
//           ),
//         ],
//       ),
//     );
//   }
// }