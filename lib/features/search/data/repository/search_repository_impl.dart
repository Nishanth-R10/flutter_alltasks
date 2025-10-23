// lib/features/search/data/repository/search_repository_impl.dart
import 'package:fpdart/fpdart.dart';
import 'package:flutter/foundation.dart';
import 'package:tasks/core/network/api_service.dart';
import 'package:tasks/features/search/data/repository/search_repository.dart';
import 'package:tasks/features/search/domain/entities/search_entity.dart';

class SearchRepositoryImpl implements SearchRepository {
  final ApiService _apiService;

  SearchRepositoryImpl(this._apiService);

  @override
  Future<Either<String, List<SearchEntity>>> getSearchSuggestions(String searchQuery) async {
    try {
      if (kDebugMode) {
        debugPrint('🔍 Fetching search suggestions for: "$searchQuery"');
      }
      
      if (searchQuery.isEmpty || searchQuery.length < 2) {
        return const Right([]);
      }

      await Future.delayed(const Duration(milliseconds: 300));

      // Simulate API response
      final simulatedData = {
        'suggestions': [
          {
            'id': '1',
            'title': '$searchQuery Service 1',
            'description': 'Best service for $searchQuery',
            'type': 'service',
            'imageUrl': 'assets/images/discovery.png',
          },
          {
            'id': '2',
            'title': '$searchQuery Feature 2', 
            'description': 'Great feature for $searchQuery',
            'type': 'feature',
            'imageUrl': 'assets/images/discovery.png',
          },
        ]
      };

      try {
        final suggestionsData = _extractSuggestionsFromResponse(simulatedData);
        final entities = suggestionsData
            .map((json) => SearchEntity.fromJson(json))
            .toList();
        
        if (kDebugMode) {
          debugPrint('✅ Search Success: ${entities.length} suggestions');
        }
        return Right(entities);
      } catch (e) {
        if (kDebugMode) debugPrint('❌ Search JSON Error: $e');
        return Left('Failed to process search results');
      }
    } catch (e) {
      if (kDebugMode) debugPrint('❌ Search Repository Error: $e');
      return Left('Search service unavailable');
    }
  }

  @override
  Future<Either<String, List<String>>> getSearchOptions(String userType) async {
    try {
      if (kDebugMode) {
        debugPrint('🔄 Fetching search options for user type: $userType');
      }
      
      if (userType.isEmpty) {
        return Left('Invalid user type');
      }

      await Future.delayed(const Duration(milliseconds: 500));

      // Return simulated options
      final options = _getSimulatedOptions(userType);
      
      if (kDebugMode) {
        debugPrint('✅ Options Success: ${options.length} options for $userType');
      }
      
      return Right(options);
      
    } catch (e) {
      if (kDebugMode) {
        debugPrint('❌ Options Error, using fallback: $e');
      }
      return Right(_getFallbackOptions(userType));
    }
  }

  List<Map<String, dynamic>> _extractSuggestionsFromResponse(Map<String, dynamic> response) {
    try {
      if (response.containsKey('suggestions') && response['suggestions'] is List) {
        return List<Map<String, dynamic>>.from(response['suggestions']);
      }
      
      if (response.containsKey('data') && response['data'] is Map) {
        final data = response['data'] as Map<String, dynamic>;
        if (data.containsKey('suggestions') && data['suggestions'] is List) {
          return List<Map<String, dynamic>>.from(data['suggestions']);
        }
      }
      
      return [];
    } catch (e) {
      if (kDebugMode) debugPrint('Response extraction error: $e');
      return [];
    }
  }

  List<String> _getSimulatedOptions(String userType) {
    final normalizedType = userType.toLowerCase();
    
    if (normalizedType.contains('new')) {
      return [
        "Mobile Recharge", "Track Billers", "Credit Card Bills", "Offers",
        "Electricity Bill", "Water Bill", "Gas Bill", "DTH Recharge",
      ];
    } else {
      return [
        "Home Finance", "Instant Finance", "Car Finance", "Personal Finance",
        "Business Loans", "Investment Plans", "Loan Services", "Wealth Management",
      ];
    }
  }

  List<String> _getFallbackOptions(String userType) {
    final normalizedType = userType.toLowerCase();
    
    if (normalizedType.contains('new')) {
      return [
        "Mobile Recharge", "Track Billers", "Credit Card Bills", "Offers",
        "Your Cheque Book", "Electricity Bill", "Water Bill", "Gas Bill",
        "DTH Recharge", "Broadband Bill", "Insurance Premium", "Loan Payment",
        "Postpaid Bill", "Landline Bill", "Municipal Tax", "Education Fee",
      ];
    } else {
      return [
        "Home Finance", "Instant Finance", "Advance Salary", "Suggestions",
        "Financial Services", "Car Finance", "Personal Finance", "Business Loans",
        "Investment Plans", "Loan Services", "Mortgage Services", "Credit Services",
        "Banking Services", "Wealth Management", "Insurance Services", "Retirement Planning"
      ];
    }
  }
}