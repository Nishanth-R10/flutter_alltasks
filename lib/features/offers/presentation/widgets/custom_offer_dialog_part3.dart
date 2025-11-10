// // lib/features/offers/presentation/widgets/custom_offer_dialog_part3.dart
// part of 'custom_offer_dialog.dart';

// extension CustomOfferDialogButtons on _CustomOfferDialogState {
//   List<Widget> _buildDontShowAgainSection(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     final screenHeight = mediaQuery.size.height;
    
//     return [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: screenWidth * 0.05, 
//             height: screenHeight * 0.025,
//             child: Checkbox(
//               value: _dontShowAgain,
//               onChanged: (value) {
//                 setState(() {
//                   _dontShowAgain = value ?? false;
//                 });
//                 if (_dontShowAgain) {
//                   ref.read(offerVisibilityProvider.notifier).state = {
//                     ...ref.read(offerVisibilityProvider),
//                     widget.offerId: true,
//                   };
//                 } else {
//                   ref.read(offerVisibilityProvider.notifier).state = {
//                     ...ref.read(offerVisibilityProvider),
//                     widget.offerId: false,
//                   };
//                 }
//               },
//               activeColor: DefaultColors.blue9D,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4),
//               ),
//             ),
//           ),
//           SizedBox(width: screenWidth * 0.02), //  0.02
//           Flexible(
//             child: Text(
//               "Don't Show this offer again!",
//               style: GoogleFonts.poppins(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w400,
//                 color: DefaultColors.gray71,
//               ),
//             ),
//           ),
//         ],
//       ),
//       SizedBox(height: screenHeight * 0.025), 
//     ];
//   }

//   Widget _buildPrimaryButton(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenHeight = mediaQuery.size.height;
    
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {
//           widget.onPrimaryButtonPressed();
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: DefaultColors.blue9D,
//           foregroundColor: DefaultColors.white,
//           padding: EdgeInsets.symmetric(vertical: screenHeight * 0.0175), 
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(25),
//           ),
//           elevation: 0,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               widget.primaryButtonText,
//               style: GoogleFonts.poppins(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(width: 8),
//             Icon(Icons.north_east, size: 18),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSecondaryButton(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenHeight = mediaQuery.size.height;
    
//     return SizedBox(
//       width: double.infinity,
//       child: OutlinedButton(
//         onPressed: () {
//           widget.onSecondaryButtonPressed();
//         },
//         style: OutlinedButton.styleFrom(
//           padding: EdgeInsets.symmetric(vertical: screenHeight * 0.0175), 
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(25),
//           ),
//           side: BorderSide(color: DefaultColors.blue9D, width: 1.5),
//         ),
//         child: Text(
//           widget.secondaryButtonText,
//           style: GoogleFonts.poppins(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: DefaultColors.blue9D,
//           ),
//         ),
//       ),
//     );
//   }
// }