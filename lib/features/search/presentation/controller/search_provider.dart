// lib/features/search/presentation/controllers/search_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../data/static_search_data.dart';

// Search Query State
final searchQueryProvider = StateProvider<String>((ref) => '');

// Search Results Provider
final searchResultsProvider = FutureProvider.autoDispose<List<String>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  return await StaticSearchData.getSearchSuggestions(query);
});

// Whats New Features Provider
final whatsNewFeaturesProvider = FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
  return await StaticSearchData.getWhatsNewFeatures();
});