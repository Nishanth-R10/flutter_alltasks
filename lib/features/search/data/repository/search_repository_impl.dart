import 'package:tasks/features/search/domain/repository/search_repository.dart';

import '../../domain/entities/search_entity.dart';
import '../../domain/entities/whats_new_entity.dart';
import '../datasources/search_api_service.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchApiService _apiService;

  SearchRepositoryImpl(this._apiService);

  @override
  Future<List<String>> getSearchSuggestions(String query) async {
    return await _apiService.getSearchSuggestions(query);
  }

  @override
  Future<List<String>> getNewUserServices() async {
    return await _apiService.getNewUserServices();
  }

  @override
  Future<List<WhatsNewEntity>> getWhatsNewFeatures() async {
    final features = await _apiService.getWhatsNewFeatures();
    return features.map((json) => WhatsNewEntity.fromJson(json)).toList();
  }

  // TODO: UNCOMMENT FOR RETURNING USER LATER
  /*
  @override
  Future<List<String>> getReturningUserServices() async {
    return await _apiService.getReturningUserServices();
  }

  Future<List<String>> getReturningUserSearchSuggestions(String query) async {
    return await _apiService.getReturningUserSearchSuggestions(query);
  }
  */
}