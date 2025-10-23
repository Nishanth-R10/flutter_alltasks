<<<<<<< HEAD
// lib/core/network/api_constants.dart
class ApiConstants {

  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  
 
  static const String searchApiBase = 'https://your-search-api.com/api';
  static const String dummyJsonBase = 'https://dummyjson.com'; 
  
  // JSONPlaceholder Endpoints
  static const String posts = '/posts';
  static const String users = '/users';
  static const String comments = '/comments';
  static const String albums = '/albums';
  static const String photos = '/photos';
  static const String todos = '/todos';
  
  // custom endpoints (if any)
  static const String searchSuggestions = '/search/suggestions';
  static const String whatsNew = '/whats-new';
  
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
=======
class ApiConstants {
  // DummyJSON API - Working API (No Authentication Required)
  static const String baseUrl = 'https://dummyjson.com';
  
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}