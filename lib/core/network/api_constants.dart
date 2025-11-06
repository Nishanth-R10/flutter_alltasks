class ApiConstants {
  // Base URLs
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String dummyJsonBaseUrl = 'https://dummyjson.com';
  
  // Home Feature Endpoints
  static const String homeOffers = '/home/offers';
  static const String homeRewards = '/home/rewards';
  static const String homeReferrals = '/home/referrals';
  static const String homeQuickActions = '/home/quick-actions';
  
  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}