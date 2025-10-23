// lib/features/search/data/repository/whats_new_repository_impl.dart
import 'package:fpdart/fpdart.dart';
import 'package:flutter/foundation.dart';
import 'package:tasks/core/network/api_service.dart';
import 'package:tasks/features/search/data/repository/whats_new_repository.dart';
import 'package:tasks/features/search/domain/entities/whats_new_entity.dart';

// RENAME THIS CLASS to avoid conflict
class WhatsNewRepositoryImpl implements WhatsNewRepository {
  final ApiService _apiService;

  WhatsNewRepositoryImpl(this._apiService);

  @override
  Future<Either<String, List<WhatsNewEntity>>> getWhatsNewFeatures() async {
    try {
      if (kDebugMode) {
        debugPrint('🔄 Fetching Whats New features');
      }

      await Future.delayed(const Duration(milliseconds: 800));
      
      // Simulate successful API response
      final simulatedResponse = [
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

      final entities = simulatedResponse
          .map((json) => WhatsNewEntity.fromJson(json))
          .toList();

      if (kDebugMode) {
        debugPrint('✅ Whats New Success: ${entities.length} features');
      }
      
      return Right(entities);
      
    } catch (e) {
      if (kDebugMode) {
        debugPrint('❌ Whats New Repository Error: $e');
      }
      return Left('Failed to load features: $e');
    }
  }
}