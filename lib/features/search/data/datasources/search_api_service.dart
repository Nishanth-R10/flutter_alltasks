// Static data service - No API calls
class SearchApiService {
  // Static data for New User
  static final List<String> newUserServices = [
    "Mobile Recharge", "Track Billers", "Credit Card Bills", "Offers",
    "Your Cheque Book", "Electricity Bill", "Water Bill", "Gas Bill",
    "DTH Recharge", "Broadband Bill", "Insurance Premium", "Loan Payment",
  ];

  // TODO: UNCOMMENT FOR RETURNING USER LATER
  /*
  static final List<String> returningUserServices = [
    "Home Finance", "Instant Finance", "Car Finance", "Personal Finance",
    "Business Loans", "Investment Plans", "Loan Services", "Wealth Management",
  ];
  */

  static final List<Map<String, dynamic>> whatsNewFeatures = [
    {
      'id': '1',
      'title': 'Track Spends',
      'description': 'Monitor your expenses in real-time',
      'imagePath': 'assets/images/discovery.png',
      'type': 'spending_tracker',
    },
    {
      'id': '2',
      'title': 'Track Forex',
      'description': 'Live foreign exchange rates',
      'imagePath': 'assets/images/discovery.png',
      'type': 'forex_tracker',
    },
  ];

  // Get search suggestions
  Future<List<String>> getSearchSuggestions(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (query.isEmpty) return [];
    final lowerQuery = query.toLowerCase();
    return newUserServices.where((service) => 
      service.toLowerCase().contains(lowerQuery)
    ).toList();
  }

  // Get New User services
  Future<List<String>> getNewUserServices() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return newUserServices;
  }

  // Get "What's New" features
  Future<List<Map<String, dynamic>>> getWhatsNewFeatures() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return whatsNewFeatures;
  }

  // TODO: UNCOMMENT FOR RETURNING USER LATER
  /*
  Future<List<String>> getReturningUserServices() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return returningUserServices;
  }

  Future<List<String>> getReturningUserSearchSuggestions(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (query.isEmpty) return [];
    final lowerQuery = query.toLowerCase();
    return returningUserServices.where((service) => 
      service.toLowerCase().contains(lowerQuery)
    ).toList();
  }
  */
}