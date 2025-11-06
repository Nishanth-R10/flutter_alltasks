import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/providers/theme_provider.dart';
import 'package:tasks/features/home/domain/entities/offer_entity.dart';

class OfferItem extends ConsumerWidget {
  final dynamic offerView;
  final VoidCallback? onTap;

  const OfferItem({super.key, required this.offerView, this.onTap});

  String _formatTitle(String title) {
    switch (title) {
      case "Invest in Gold":
        return "Invest\nin Gold";
      case "Tours & Attractions":
        return "Tours &\nAttractions";
      case "Offers on Flight Booking":
        return "Offers on\nFlight Booking";
      default:
        return title;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Handle both OfferEntity and Map types
    final offer = offerView is OfferEntity 
        ? offerView as OfferEntity
        : OfferEntity.fromJson(offerView as Map<String, dynamic>);
    
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
                  _buildOfferCircle(context, ref, offer),
                  if (offer.discountText?.isNotEmpty ?? false) 
                    _buildDiscountBadge(context, ref, offer),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.006),
            _buildOfferTitle(context, ref, offer),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferCircle(BuildContext context, WidgetRef ref, OfferEntity offer) {
    final theme = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      width: screenWidth * 0.15,
      height: screenWidth * 0.15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: theme.colorScheme.primary,
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
        child: offer.iconAsset.isNotEmpty
            ? Image.asset(offer.iconAsset, fit: BoxFit.cover)
            : Container(
                color: theme.colorScheme.primary.withOpacity(0.1),
                child: Icon(
                  Icons.local_offer,
                  color: theme.colorScheme.primary,
                  size: screenWidth * 0.06,
                ),
              ),
      ),
    );
  }

  Widget _buildDiscountBadge(BuildContext context, WidgetRef ref, OfferEntity offer) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
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
          offer.discountText!,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: screenWidth * 0.02,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildOfferTitle(BuildContext context, WidgetRef ref, OfferEntity offer) {
    final theme = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    
    return SizedBox(
      width: screenWidth * 0.2,
      child: Text(
        _formatTitle(offer.title),
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: screenWidth * 0.028,
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
          height: 1.4,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}