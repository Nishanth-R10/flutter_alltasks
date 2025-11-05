// lib/features/search/data/datasources/search_api_service.dart

import 'package:fpdart/fpdart.dart';
import 'package:tasks/core/network/api_service.dart';

class SearchApiService {
  final ApiService _apiService;

  SearchApiService(this._apiService);

  // Get search suggestions
  Future<Either<String, Map<String, dynamic>>> getSearchSuggestions(String query) async {
    return _apiService.get(
      '/search/suggestions',
      queryParameters: {'q': query},
      useFallback: true,
    );
  }

  // Get search options based on user type
  Future<Either<String, Map<String, dynamic>>> getSearchOptions(String userType) async {
    return _apiService.get(
      '/search/options',
      queryParameters: {'user_type': userType},
      useFallback: true,
    );
  }

  // Get "What's New" features
  Future<Either<String, Map<String, dynamic>>> getWhatsNewFeatures() async {
    return _apiService.get(
      '/whats-new',
      useFallback: true,
    );
  }

  // Search financial services
  Future<Either<String, Map<String, dynamic>>> searchFinancialServices(String query) async {
    return _apiService.get(
      '/search/financial',
      queryParameters: {'q': query},
      useFallback: true,
    );
  }

  // Search new user services
  Future<Either<String, Map<String, dynamic>>> searchNewUserServices(String query) async {
    return _apiService.get(
      '/search/new-user',
      queryParameters: {'q': query},
      useFallback: true,
    );
  }
}