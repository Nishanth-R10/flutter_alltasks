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
  if (kDebugMode) debugPrint('Fetching search suggestions for: "$searchQuery"');
      
      if (searchQuery.isEmpty) {
        return const Right([]);
      }

      final result = await _apiService.get<Map<String, dynamic>>('/search/suggestions?q=$searchQuery');
      
      return result.fold(
        (error) => Left('Search API Error: $error'),
        (data) {
          try {
            final suggestionsData = _extractSuggestionsFromResponse(data);
            final entities = suggestionsData
                .map((json) => SearchEntity.fromJson(json))
                .toList();
            
            if (kDebugMode) debugPrint('Search API Success: ${entities.length} suggestions');
            return Right(entities);
          } catch (e) {
            if (kDebugMode) debugPrint('Search JSON Parsing Error: $e');
            return Left('Failed to parse search results: $e');
          }
        },
      );
    } catch (e) {
  if (kDebugMode) debugPrint('Search Repository Error: $e');
      return Left('Search failed: $e');
    }
  }

  @override
  Future<Either<String, List<String>>> getSearchOptions(String userType) async {
    try {
  if (kDebugMode) debugPrint('🔄 Fetching search options for user type: $userType');
      
      // i used fallback data since we don't have a real API endpoint
      // In production, we would call: await _dioClient.get<Map<String, dynamic>>('/search/options?user_type=$userType');
      
      await Future.delayed(const Duration(milliseconds: 500)); //  API delay
      
      final options = _getFallbackOptions(userType);
  if (kDebugMode) debugPrint('✅ Options Success: ${options.length} options for $userType');
      return Right(options);
      
    } catch (e) {
  if (kDebugMode) debugPrint('❌ Options Repository Error, using fallback: $e');
      return Right(_getFallbackOptions(userType));
    }
  }

  List<Map<String, dynamic>> _extractSuggestionsFromResponse(Map<String, dynamic> response) {
    if (response.containsKey('data') && response['data'] is Map) {
      final data = response['data'] as Map<String, dynamic>;
      if (data.containsKey('suggestions') && data['suggestions'] is List) {
        return List<Map<String, dynamic>>.from(data['suggestions']);
      }
    }
    
    // Fallback to empty list
    return [];
  }

  List<String> _getFallbackOptions(String userType) {
    return userType == 'new_user'
        ? [
            "Mobile Recharge", "Track Billers", "Credit Card Bills", "Offers",
            "Your Cheque Book", "Electricity Bill", "Water Bill", "Gas Bill",
            "DTH Recharge", "Broadband Bill", "Insurance Premium", "Loan Payment",
            "Postpaid Bill", "Landline Bill", "Municipal Tax", "Education Fee",
            "Fastag Recharge", "Cable TV Bill"
          ]
        : [
            "Home Finance", "Instant Finance", "Advance Salary", "Suggestions",
            "Financial Services", "Car Finance", "Personal Finance", "Business Loans",
            "Investment Plans", "Loan Services", "Mortgage Services", "Credit Services",
            "Banking Services", "Wealth Management", "Insurance Services", "Retirement Planning"
          ];
  }
}