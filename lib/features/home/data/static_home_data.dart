class StaticHomeData {
  // Hardcoded offers data as simple Maps
  static List<Map<String, dynamic>> get offersData {
    return [
      {
        'id': '1',
        'title': 'Offers on Flight Booking',
        'description': 'Special discounts on flight bookings',
        'imageUrl': 'assets/images/flight.png',
        'offerType': 'flights',
        'iconAsset': 'assets/images/flight.png',
        'discountText': '25% OFF',
      },
      {
        'id': '2',
        'title': 'Invest in Gold',
        'description': 'Get amazing discounts on gold investments',
        'imageUrl': 'assets/images/gold-bars.jpg',
        'offerType': 'gold',
        'iconAsset': 'assets/images/gold-bars.jpg',
        'discountText': '15% OFF',
      },
      {
        'id': '3',
        'title': 'Tours & Attractions',
        'description': 'Exciting tour packages with great deals',
        'imageUrl': 'assets/images/tourist.jpg',
        'offerType': 'tours',
        'iconAsset': 'assets/images/tourist.jpg',
        'discountText': '20% OFF',
      },
    ];
  }

  // Hardcoded referral data as simple Map
  static Map<String, dynamic> get referralData {
    return {
      'referralCode': 'FRIEND100',
      'rewardPoints': 250,
      'totalEarnings': 1250.0,
      'friendsReferred': 5,
    };
  }

  // Hardcoded rewards data as simple Map
  static Map<String, dynamic> get rewardsData {
    return {
      'totalPoints': 1000,
      'pointsEarned': 650,
      'progressPercentage': 65.0,
      'amountAway': 350.0,
      'nextRewardThreshold': 1000.0,
    };
  }
}