// // lib/features/offers/presentation/widgets/custom_offer_dialog_part2.dart
// part of 'custom_offer_dialog.dart';

// extension CustomOfferDialogUI on _CustomOfferDialogState {
//   Widget _buildTitle(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
    
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01), 
//       child: FittedBox(
//         fit: BoxFit.scaleDown,
//         child: Text(
//           widget.title,
//           style: GoogleFonts.poppins(
//             fontSize: 18,
//             fontWeight: FontWeight.w700,
//             color: DefaultColors.blue9D,
//           ),
//           textAlign: TextAlign.center,
//           maxLines: 1,
//         ),
//       ),
//     );
//   }

//   Widget _buildContentRow(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
    
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildImageStack(context),
//         SizedBox(width: screenWidth * 0.04), 
//         _buildDescription(context),
//       ],
//     );
//   }

//   Widget _buildImageStack(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     final screenHeight = mediaQuery.size.height;
    
//     return SizedBox(
//       width: screenWidth * 0.25, 
//       height: screenHeight * 0.1125, 
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           // Background rotated card 
//           Positioned(
//             right: 0,
//             top: screenHeight * 0.03125, 
//             child: Transform.rotate(
//               angle: -0.2,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.asset(
//                   'assets/images/credit.png',
//                   width: screenWidth * 0.225, 
//                   height: screenHeight * 0.06875,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ),
          
//           Positioned(
//             left: screenWidth * 0.0125, 
//             top: screenHeight * 0.05,
//             child: Transform.rotate(
//               angle: 0,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.asset(
//                   'assets/images/visa.png',
//                   width: screenWidth * 0.225, 
//                   height: screenHeight * 0.0625, 
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDescription(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenHeight = mediaQuery.size.height;
    
//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.only(top: screenHeight * 0.01),
//         child: RichText(
//           textAlign: TextAlign.left,
//           text: TextSpan(
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//               color: DefaultColors.black,
//               height: 1.5,
//             ),
//             children: _parseDescription(),
//           ),
//         ),
//       ),
//     );
//   }

//   List<TextSpan> _parseDescription() {
//     final words = widget.description.split(' ');
//     List<TextSpan> spans = [];

//     for (int i = 0; i < words.length; i++) {
//       String word = words[i];
//       bool isBold = word.contains(RegExp(r'\d')) ||
//           word.toLowerCase().contains('maximum') ||
//           word.toLowerCase().contains('limit') ||
//           word.toLowerCase().contains('upto');

//       spans.add(
//         TextSpan(
//           text: word + (i < words.length - 1 ? ' ' : ''),
//           style: GoogleFonts.poppins(
//             fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
//             color: DefaultColors.black,
//           ),
//         ),
//       );
//     }
//     return spans;
//   }
// }