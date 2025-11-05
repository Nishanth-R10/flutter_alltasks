import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/search/data/datasources/search_api_service.dart';
import 'package:tasks/features/search/data/repository/search_repository_impl.dart';
import 'package:tasks/features/search/domain/repository/search_repository.dart';


// Service Provider
final searchApiServiceProvider = Provider<SearchApiService>((ref) {
  return SearchApiService();
});

// Repository Provider
final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  final apiService = ref.read(searchApiServiceProvider);
  return SearchRepositoryImpl(apiService);
});