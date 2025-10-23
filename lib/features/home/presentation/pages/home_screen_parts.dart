// lib/features/home/presentation/pages/home_screen_parts.dart
part of '../../home_screen.dart';

extension HomeScreenParts on HomeScreenState {
  Widget _buildCreditCardOfferSection(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(isOfferLoadingProvider);
    
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(16)),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
        border: Border.all(color: Colors.orange),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.credit_card, color: Colors.orange),
              SizedBox(width: MediaQueryUtils.w(8)),
              Text(
                "DFC CREDIT CARD OFFER",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.orange[700],
                  fontSize: MediaQueryUtils.sp(14),
                ),
              ),
              if (isLoading) ...[
                SizedBox(width: MediaQueryUtils.w(8)),
                SizedBox(
                  width: MediaQueryUtils.w(16),
                  height: MediaQueryUtils.h(16),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: MediaQueryUtils.h(12)),
          Text(
            isLoading 
                ? "Loading your special offer..." 
                : "Instant credit card with premium benefits",
            style: GoogleFonts.poppins(
              fontSize: MediaQueryUtils.sp(12),
              color: Colors.orange[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQueryUtils.h(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: isLoading 
                    ? null 
                    : () => OfferService.showCreditCardOffer(context, ref),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: isLoading 
                    ? SizedBox(
                        width: MediaQueryUtils.w(16),
                        height: MediaQueryUtils.h(16),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text('Show Offer '),
              ),
            ]),
          SizedBox(height: MediaQueryUtils.h(8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        final offerData = ref.read(creditCardOfferProvider);
                        final offerId = offerData['id'] as String? ?? '';
                        OfferService.resetOfferVisibility(ref, offerId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Offer visibility reset!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  side: BorderSide(color: Colors.orange),
                ),
                child: Text('Reset Offer'),
              ),
              if (isLoading) 
                OutlinedButton(
                  onPressed: () => OfferService.closeAllDialogs(context, ref),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: BorderSide(color: Colors.red),
                  ),
                  child: Text('Cancel Loading'),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserTypeToggle(WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(12)),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DefaultString.instance.userType,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: MediaQueryUtils.sp(14),
            ),
          ),
          Row(
            children: [
              Text(
                DefaultString.instance.newUser,
                style: GoogleFonts.poppins(
                  fontSize: MediaQueryUtils.sp(12),
                  color: ref.watch(userTypeProvider) == UserType.newUser 
                      ? Colors.blue 
                      : Colors.grey,
                ),
              ),
              Switch(
                value: ref.watch(userTypeProvider) == UserType.returningUser,
                onChanged: (value) {
                  ref.read(userTypeProvider.notifier).state = 
                      value ? UserType.returningUser : UserType.newUser;
                },
              ),
              Text(
                DefaultString.instance.returningUser,
                style: GoogleFonts.poppins(
                  fontSize: MediaQueryUtils.sp(12),
                  color: ref.watch(userTypeProvider) == UserType.returningUser 
                      ? Colors.blue 
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}