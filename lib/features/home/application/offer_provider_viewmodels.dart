// lib/features/home/application/offer_provider_viewmodels.dart
part of 'offer_provider.dart';

// View model to carry UI metadata (discount badge, icon asset) alongside the API OfferEntity
class OfferViewModel {
  final OfferEntity entity;
  final String? discountText;
  final String? iconAsset; // local asset path, if any

  OfferViewModel({required this.entity, this.discountText, this.iconAsset});
}

// Provider that maps API OfferEntity list to OfferViewModel list
final offersViewProvider = FutureProvider<List<OfferViewModel>>((ref) async {
  final offers = await ref.watch(offersFutureProvider.future);
  final views = <OfferViewModel>[];
  for (final o in offers) {
    // Heuristic: if title mentions flight, apply flight discount and use a flight asset
    final title = o.title.toLowerCase();
    String? discount;
    String? asset;
    if (title.contains('flight')) {
      discount = '20% OFF';
      asset = 'assets/images/flight.png';
    } else if (title.contains('gold')) {
      // Gold investment offer
      asset = 'assets/images/gold-bars.jpg';
    } else if (title.contains('tour') || title.contains('attraction')) {
      asset = 'assets/images/tourist.jpg';
    } else if (title.contains('invest') || title.contains('investment')) {
      asset = 'assets/images/inevest.jpg';
    } else if (o.imageUrl.startsWith('assets/')) {
      // if the API already provided an asset path, prefer it
      asset = o.imageUrl;
    }

    views.add(OfferViewModel(entity: o, discountText: discount, iconAsset: asset));
  }
  return views;
});