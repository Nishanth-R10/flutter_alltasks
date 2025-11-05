import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'search_repository_provider.dart';
import 'search_state_provider.dart';

// Search Results Provider
final searchResultsProvider = FutureProvider.autoDispose<List<String>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  final repository = ref.read(searchRepositoryProvider);
  
  if (query.isEmpty) {
    return await repository.getNewUserServices();
  }
  
  return await repository.getSearchSuggestions(query);
});

// TODO: UNCOMMENT WHEN ADDING RETURNING USER LATER
/*
final returningUserSearchResultsProvider = FutureProvider.autoDispose<List<String>>((ref) async {
  final query = ref.watch(returningUserSearchQueryProvider);
  final repository = ref.read(searchRepositoryProvider);
  
  if (query.isEmpty) {
    return await repository.getReturningUserServices();
  }
  
  return await repository.getReturningUserSearchSuggestions(query);
});
*/