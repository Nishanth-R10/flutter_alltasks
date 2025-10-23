// lib/features/search/data/repository/whats_new_repository_impl.dart
import 'package:fpdart/fpdart.dart';
import 'package:flutter/foundation.dart';
import 'package:tasks/core/network/api_service.dart';
import 'package:tasks/core/network/dio_client.dart';
import 'package:tasks/features/search/data/repository/whats_new_repository.dart';
import 'package:tasks/features/search/domain/entities/whats_new_entity.dart';

class WhatsNewRepositoryImpl implements WhatsNewRepository {
  final ApiService _apiService;

  WhatsNewRepositoryImpl(this._apiService);

  @override
  Future<Either<String, List<WhatsNewEntity>>> getWhatsNewFeatures() async {
    try {
      if (kDebugMode) debugPrint("Fetching what's new features...");

      final result = await _apiService.get<Map<String, dynamic>>('/whats-new');

      return result.fold(
        (error) {
          if (kDebugMode) debugPrint('WhatsNew API failed, using fallback: $error');
          return Right(_getFallbackFeatures());
        },
        (data) {
          try {
            final featuresData = _extractFeaturesFromResponse(data);
            final entities = featuresData
                .map((json) => WhatsNewEntity.fromJson(json))
                .toList();
            
            if (kDebugMode) debugPrint('WhatsNew API Success: ${entities.length} features');
            return Right(entities);
          } catch (e) {
            if (kDebugMode) debugPrint('WhatsNew JSON Parsing Error, using fallback: $e');
            return Right(_getFallbackFeatures());
          }
        },
      );
    } catch (e) {
  if (kDebugMode) debugPrint('WhatsNew Repository Error, using fallback: $e');
      return Right(_getFallbackFeatures());
    }
  }

  List<Map<String, dynamic>> _extractFeaturesFromResponse(Map<String, dynamic> response) {
    if (response.containsKey('data') && response['data'] is Map) {
      final data = response['data'] as Map<String, dynamic>;
      if (data.containsKey('features') && data['features'] is List) {
        return List<Map<String, dynamic>>.from(data['features']);
      }
    }
    
    return _getFallbackFeatures().map((feature) => feature.toJson()).toList();
  }

  List<WhatsNewEntity> _getFallbackFeatures() {
    return [
      const WhatsNewEntity(
        id: 'fallback_1',
        title: 'Track Spends',
        description: 'Monitor your expenses in real-time',
        imagePath: 'assets/images/discovery.png',
        type: 'spending_tracker',
      ),
      const WhatsNewEntity(
        id: 'fallback_2',
        title: 'Track Forex',
        description: 'Live foreign exchange rates',
        imagePath: 'assets/images/discovery.png',
        type: 'forex_tracker',
      ),
    ];
  }
}