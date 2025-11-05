// lib/features/search/data/repositories/search_repositories.dart

import 'package:fpdart/fpdart.dart';
import 'package:flutter/foundation.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/features/search/data/datasources/search_api_service.dart';
import '../../domain/entities/search_entity.dart';
import '../../domain/entities/whats_new_entity.dart';

abstract class SearchRepository {
  Future<Either<String, List<SearchEntity>>> getSearchSuggestions(String searchQuery);
  Future<Either<String, List<String>>> getSearchOptions(String userType);
}

class SearchRepositoryImpl implements SearchRepository {
  final SearchApiService _searchApiService;

  SearchRepositoryImpl(this._searchApiService);

  @override
  Future<Either<String, List<SearchEntity>>> getSearchSuggestions(String searchQuery) async {
    try {
      if (kDebugMode) {
        debugPrint(' Fetching search suggestions for: "$searchQuery"');
      }
      
      if (searchQuery.isEmpty || searchQuery.length < 2) {
        return const Right([]);
      }

      // Use the dedicated search API service
      final result = await _searchApiService.getSearchSuggestions(searchQuery);
      
      return result.fold(
        (error) {
          if (kDebugMode) debugPrint(' Search API Error: $error');
          return Right(_getFallbackSuggestions(searchQuery));
        },
        (data) {
          try {
            final suggestionsData = _extractSuggestionsFromResponse(data);
            final entities = suggestionsData
                .map((json) => SearchEntity.fromJson(json))
                .toList();
            
            if (kDebugMode) {
              debugPrint(' Search Success: ${entities.length} suggestions');
            }
            return Right(entities);
          } catch (e) {
            if (kDebugMode) debugPrint(' Search JSON Error: $e');
            return Right(_getFallbackSuggestions(searchQuery));
          }
        },
      );
    } catch (e) {
      if (kDebugMode) debugPrint(' Search Repository Error: $e');
      return Left('Search service unavailable');
    }
  }

  @override
  Future<Either<String, List<String>>> getSearchOptions(String userType) async {
    try {
      if (kDebugMode) {
        debugPrint(' Fetching search options for user type: $userType');
      }
      
      if (userType.isEmpty) {
        return Left('Invalid user type');
      }

      // Use the dedicated search API service
      final result = await _searchApiService.getSearchOptions(userType);
      
      return result.fold(
        (error) {
          if (kDebugMode) debugPrint(' Options API Error: $error');
          return Right(_getFallbackOptions(userType));
        },
        (data) {
          try {
            final options = _extractOptionsFromResponse(data, userType);
            if (kDebugMode) {
              debugPrint(' Options Success: ${options.length} options for $userType');
            }
            return Right(options);
          } catch (e) {
            if (kDebugMode) debugPrint(' Options JSON Error: $e');
            return Right(_getFallbackOptions(userType));
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint(' Options Error, using fallback: $e');
      }
      return Right(_getFallbackOptions(userType));
    }
  }

  List<SearchEntity> _getFallbackSuggestions(String searchQuery) {
    return [
      SearchEntity.fromJson({
        'id': '1',
        'title': '$searchQuery Service 1',
        'description': 'Best service for $searchQuery',
        'type': 'service',
        'imageUrl': 'assets/images/discovery.png',
      }),
      SearchEntity.fromJson({
        'id': '2',
        'title': '$searchQuery Feature 2', 
        'description': 'Great feature for $searchQuery',
        'type': 'feature',
        'imageUrl': 'assets/images/discovery.png',
      }),
    ];
  }

  List<String> _extractOptionsFromResponse(Map<String, dynamic> response, String userType) {
    try {
      if (response.containsKey('data') && response['data'] is Map) {
        final data = response['data'] as Map<String, dynamic>;
        if (data.containsKey('services') && data['services'] is List) {
          return List<String>.from(data['services']);
        }
      }
      return _getFallbackOptions(userType);
    } catch (e) {
      if (kDebugMode) debugPrint('Options extraction error: $e');
      return _getFallbackOptions(userType);
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

  List<String> _getFallbackOptions(String userType) {
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
}

abstract class WhatsNewRepository {
  Future<Either<String, List<WhatsNewEntity>>> getWhatsNewFeatures();
}

class WhatsNewRepositoryImpl implements WhatsNewRepository {
  final SearchApiService _searchApiService;

  WhatsNewRepositoryImpl(this._searchApiService);

  @override
  Future<Either<String, List<WhatsNewEntity>>> getWhatsNewFeatures() async {
    try {
      if (kDebugMode) {
        debugPrint(' Fetching Whats New features');
      }

      // Use the dedicated search API service
      final result = await _searchApiService.getWhatsNewFeatures();
      
      return result.fold(
        (error) {
          if (kDebugMode) debugPrint(' Whats New API Error: $error');
          return Right(_getFallbackFeatures());
        },
        (data) {
          try {
            final features = _extractFeaturesFromResponse(data);
            final entities = features
                .map((json) => WhatsNewEntity.fromJson(json))
                .toList();

            if (kDebugMode) {
              debugPrint(' Whats New Success: ${entities.length} features');
            }
            return Right(entities);
          } catch (e) {
            if (kDebugMode) debugPrint(' Whats New JSON Error: $e');
            return Right(_getFallbackFeatures());
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint('❌ Whats New Repository Error: $e');
      }
      return Left('Failed to load features: $e');
    }
  }

  List<Map<String, dynamic>> _extractFeaturesFromResponse(Map<String, dynamic> response) {
    try {
      if (response.containsKey('features') && response['features'] is List) {
        return List<Map<String, dynamic>>.from(response['features']);
      }
      
      if (response.containsKey('data') && response['data'] is Map) {
        final data = response['data'] as Map<String, dynamic>;
        if (data.containsKey('features') && data['features'] is List) {
          return List<Map<String, dynamic>>.from(data['features']);
        }
      }
      
      return _getFallbackFeatures().map((entity) => entity.toJson()).toList();
    } catch (e) {
      if (kDebugMode) debugPrint('Features extraction error: $e');
      return _getFallbackFeatures().map((entity) => entity.toJson()).toList();
    }
  }

  List<WhatsNewEntity> _getFallbackFeatures() {
    return [
      const WhatsNewEntity(
        id: '1',
        title: 'Track Spends',
        description: 'Monitor your expenses in real-time',
        imagePath: 'assets/images/discovery.png',
        type: 'spending_tracker',
      ),
      const WhatsNewEntity(
        id: '2',
        title: 'Track Forex',
        description: 'Live foreign exchange rates',
        imagePath: 'assets/images/discovery.png', 
        type: 'forex_tracker',
      ),
    ];
  }
}