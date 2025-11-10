import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_colors/default_colors.dart';

class OfferItem extends StatelessWidget {
  final Map<String, dynamic> offerData; // Accept Map data directly
  final VoidCallback? onTap;

  const OfferItem({super.key, required this.offerData, this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: screenWidth * 0.2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: screenHeight * 0.07,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  _buildOfferCircle(context, screenWidth),
                  if (offerData['discountText'] != null && (offerData['discountText'] as String).isNotEmpty) 
                    _buildDiscountBadge(context, screenWidth, screenHeight),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.006),
            _buildOfferTitle(context, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferCircle(BuildContext context, double screenWidth) {
    return Container(
      width: screenWidth * 0.15,
      height: screenWidth * 0.15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: DefaultColors.blueLightBase,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
          ),
        ],
      ),
      child: ClipOval(
        child: (offerData['iconAsset'] as String).isNotEmpty
            ? Image.asset(offerData['iconAsset'] as String, fit: BoxFit.cover)
            : Container(
                color: DefaultColors.blueLightBase.withOpacity(0.1),
                child: Icon(
                  Icons.local_offer,
                  color: DefaultColors.blueLightBase,
                  size: screenWidth * 0.06,
                ),
              ),
      ),
    );
  }

  Widget _buildDiscountBadge(BuildContext context, double screenWidth, double screenHeight) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenHeight * 0.004,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFC321DC),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          offerData['discountText'] as String,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: screenWidth * 0.02,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildOfferTitle(BuildContext context, double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.2,
      child: Text(
        offerData['title'] as String,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: screenWidth * 0.028,
          fontWeight: FontWeight.w600,
          color: DefaultColors.black,
          height: 1.4,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}