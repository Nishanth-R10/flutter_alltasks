// lib/features/search/data/static_search_data.dart
class StaticSearchData {
  static final List<String> newUserServices = [
    "Mobile Recharge", "Track Billers", "Credit Card Bills", "Offers",
    "Your Cheque Book", "Electricity Bill", "Water Bill", "Gas Bill",
    "DTH Recharge", "Broadband Bill", "Insurance Premium", "Loan Payment",
  ];

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

  static Future<List<String>> getSearchSuggestions(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (query.isEmpty) return newUserServices;
    
    final lowerQuery = query.toLowerCase();
    return newUserServices.where((service) => 
      service.toLowerCase().contains(lowerQuery)
    ).toList();
  }

  static Future<List<Map<String, dynamic>>> getWhatsNewFeatures() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return whatsNewFeatures;
  }
}