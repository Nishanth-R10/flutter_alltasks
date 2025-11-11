import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors/default_colors.dart';
class OfferItem extends StatelessWidget {
  final Map<String, dynamic> offerData;
  final VoidCallback? onTap;

  const OfferItem({super.key, required this.offerData, this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
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
                    _buildDiscountBadge(context),
                ],
              ),
            ),
            const SizedBox(height: 6),
            _buildOfferTitle(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferCircle(BuildContext context, double screenWidth) {
    return Container(
      width: 60,
      height: 60,
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
                  size: 24,
                ),
              ),
      ),
    );
  }

  Widget _buildDiscountBadge(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: const Color(0xFFC321DC),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          offerData['discountText'] as String,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildOfferTitle(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Text(
        offerData['title'] as String,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
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