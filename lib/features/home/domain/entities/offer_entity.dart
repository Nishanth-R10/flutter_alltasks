// Add these properties to your existing OfferEntity class
class OfferEntity {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String offerType; // 'flights', 'gold', 'tours', 'invest'
  final String iconAsset; // Add this property
  final String? discountText; // Add this property

  const OfferEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.offerType,
    required this.iconAsset, // Add to constructor
    this.discountText, // Add to constructor
  });

  // Update fromJson method
  factory OfferEntity.fromJson(Map<String, dynamic> json) {
    // Define offer types and icons based on ID or title
    final offerTypes = ['flights', 'gold', 'tours', 'invest'];
    final icons = [
      'assets/offers/flight.png',
      'assets/offers/gold.png', 
      'assets/offers/tours.png',
      'assets/offers/invest.png'
    ];
    
    final id = json['id']?.toString() ?? '0';
    final index = (int.tryParse(id) ?? 0) % offerTypes.length;
    
    return OfferEntity(
      id: id,
      title: json['title']?.toString() ?? 'No Title',
      description: json['body']?.toString() ?? 'No Description', // Using 'body' from JSONPlaceholder
      imageUrl: json['imageUrl']?.toString() ?? '',
      offerType: offerTypes[index],
      iconAsset: icons[index],
      discountText: index % 2 == 0 ? '${10 + (index * 5)}% OFF' : null,
    );
  }

  // Update toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'offerType': offerType,
      'iconAsset': iconAsset,
      'discountText': discountText,
    };
  }

  // Update copyWith method
  OfferEntity copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    String? offerType,
    String? iconAsset,
    String? discountText,
  }) {
    return OfferEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      offerType: offerType ?? this.offerType,
      iconAsset: iconAsset ?? this.iconAsset,
      discountText: discountText ?? this.discountText,
    );
  }

  // Rest of your existing methods remain the same...
}