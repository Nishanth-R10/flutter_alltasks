import 'package:fpdart/fpdart.dart';
import 'package:flutter/foundation.dart';
import 'package:tasks/core/network/api_service.dart';
import 'package:tasks/features/search/domain/entities/search_entity.dart';
import 'package:tasks/features/search/domain/entities/whats_new_entity.dart';

abstract class SearchRepository {
  Future<Either<String, List<SearchEntity>>> getSearchSuggestions(String searchQuery);
  Future<Either<String, List<String>>> getSearchOptions(String userType);
}

class SearchRepositoryImpl implements SearchRepository {
  final ApiService _apiService;
  SearchRepositoryImpl(this._apiService);

  @override
  Future<Either<String, List<SearchEntity>>> getSearchSuggestions(String searchQuery) async {
    try {
      if (kDebugMode) debugPrint('🔍 Fetching search suggestions for: "$searchQuery"');
      
      if (searchQuery.isEmpty || searchQuery.length < 2) return const Right([]);
      await Future.delayed(const Duration(milliseconds: 300));

      final simulatedData = {'suggestions': [
        {'id': '1', 'title': '$searchQuery Service 1', 'type': 'service', 'imageUrl': 'assets/images/discovery.png'},
        {'id': '2', 'title': '$searchQuery Feature 2', 'type': 'feature', 'imageUrl': 'assets/images/discovery.png'},
      ]};

      final suggestionsData = _extractSuggestionsFromResponse(simulatedData);
      final entities = suggestionsData.map((json) => SearchEntity.fromJson(json)).toList();
      
      if (kDebugMode) debugPrint('✅ Search Success: ${entities.length} suggestions');
      return Right(entities);
    } catch (e) {
      if (kDebugMode) debugPrint('❌ Search Repository Error: $e');
      return Left('Search service unavailable');
    }
  }

  @override
  Future<Either<String, List<String>>> getSearchOptions(String userType) async {
    try {
      if (kDebugMode) debugPrint('🔄 Fetching search options for user type: $userType');
      if (userType.isEmpty) return Left('Invalid user type');
      await Future.delayed(const Duration(milliseconds: 500));

      final options = _getSimulatedOptions(userType);
      if (kDebugMode) debugPrint('✅ Options Success: ${options.length} options for $userType');
      return Right(options);
    } catch (e) {
      if (kDebugMode) debugPrint('❌ Options Error, using fallback: $e');
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
      return ["Mobile Recharge", "Track Billers", "Credit Card Bills", "Offers", "Electricity Bill", "Water Bill", "Gas Bill", "DTH Recharge"];
    } else {
      return ["Home Finance", "Instant Finance", "Car Finance", "Personal Finance", "Business Loans", "Investment Plans", "Loan Services", "Wealth Management"];
    }
  }

  List<String> _getFallbackOptions(String userType) {
    final normalizedType = userType.toLowerCase();
    if (normalizedType.contains('new')) {
      return ["Mobile Recharge", "Track Billers", "Credit Card Bills", "Offers", "Your Cheque Book", "Electricity Bill", "Water Bill", "Gas Bill", "DTH Recharge", "Broadband Bill"];
    } else {
      return ["Home Finance", "Instant Finance", "Advance Salary", "Suggestions", "Financial Services", "Car Finance", "Personal Finance", "Business Loans", "Investment Plans", "Loan Services"];
    }
  }
}

abstract class WhatsNewRepository {
  Future<Either<String, List<WhatsNewEntity>>> getWhatsNewFeatures();
}

class WhatsNewRepositoryImpl implements WhatsNewRepository {
  final ApiService _apiService;
  WhatsNewRepositoryImpl(this._apiService);

  @override
  Future<Either<String, List<WhatsNewEntity>>> getWhatsNewFeatures() async {
    try {
      if (kDebugMode) debugPrint('🔄 Fetching Whats New features');
      await Future.delayed(const Duration(milliseconds: 800));
      
      final simulatedResponse = [
        {'id': '1', 'title': 'Track Spends', 'description': 'Monitor expenses', 'imagePath': 'assets/images/discovery.png', 'type': 'spending_tracker'},
        {'id': '2', 'title': 'Track Forex', 'description': 'Live exchange rates', 'imagePath': 'assets/images/discovery.png', 'type': 'forex_tracker'},
      ];

      final entities = simulatedResponse.map((json) => WhatsNewEntity.fromJson(json)).toList();
      if (kDebugMode) debugPrint('✅ Whats New Success: ${entities.length} features');
      return Right(entities);
    } catch (e) {
      if (kDebugMode) debugPrint('❌ Whats New Repository Error: $e');
      return Left('Failed to load features: $e');
    }
  }
}