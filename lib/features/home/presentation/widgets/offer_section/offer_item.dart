import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/offers/domain/entities/offer_entity.dart';
import 'package:tasks/core/providers/theme_provider.dart';

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
                  _buildOfferCircle(context, ref),
                  if ((offerView?.discountText as String?)?.isNotEmpty ?? false) 
                    _buildDiscountBadge(context, ref),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.006),
            _buildOfferTitle(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferCircle(BuildContext context, WidgetRef ref) {
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
        child: Builder(builder: (context) {
          final entity = offerView?.entity as OfferEntity?;
          final asset = offerView?.iconAsset ?? entity?.imageUrl ?? '';
          if (asset.isNotEmpty) {
            if (asset.startsWith('assets/')) {
              return Image.asset(asset, fit: BoxFit.cover);
            }
            return Image.network(asset, fit: BoxFit.cover);
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }

  Widget _buildDiscountBadge(BuildContext context, WidgetRef ref) {
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
          (offerView?.discountText as String?) ?? '',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: screenWidth * 0.02,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildOfferTitle(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    
    return SizedBox(
      width: screenWidth * 0.2,
      child: Text(
        _formatTitle((offerView?.entity?.title as String?) ?? ''),
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