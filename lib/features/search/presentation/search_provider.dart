// lib/features/search/presentation/providers/search_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tasks/features/search/data/repository/search_repository.dart';
import 'package:tasks/features/search/domain/entities/search_entity.dart';
import 'package:tasks/features/search/domain/entities/whats_new_entity.dart';
import '../data/datasources/search_api_service_provider.dart';

// Repositories
final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  final searchApiService = ref.read(searchApiServiceProvider);
  return SearchRepositoryImpl(searchApiService);
});

final whatsNewRepositoryProvider = Provider<WhatsNewRepository>((ref) {
  final searchApiService = ref.read(searchApiServiceProvider);
  return WhatsNewRepositoryImpl(searchApiService);
});


// Search State Providers
final newUserSearchQueryProvider = StateProvider<String>((ref) => '');
final financialSearchQueryProvider = StateProvider<String>((ref) => '');

// Search Options Provider
final searchOptionsProvider = FutureProvider.autoDispose
    .family<List<String>, String>((ref, userType) async {
  
  final repository = ref.read(searchRepositoryProvider);
  final result = await repository.getSearchOptions(userType);
  
  return result.fold(
    (error) => _getFallbackOptions(userType),
    (options) => options,
  );
});

// New User Services Provider
final newUserServicesProvider = FutureProvider.autoDispose<List<String>>((ref) {
  return ref.read(searchOptionsProvider('new_user').future);
});

// Financial Services Provider  
final financialServicesProvider = FutureProvider.autoDispose<List<String>>((ref) {
  return ref.read(searchOptionsProvider('returning_user').future);
});

// Search Suggestions Provider
final searchSuggestionsProvider = FutureProvider.autoDispose
    .family<List<SearchEntity>, String>((ref, searchQuery) async {
  
  if (searchQuery.isEmpty || searchQuery.length < 2) {
    return [];
  }

  final repository = ref.read(searchRepositoryProvider);
  final result = await repository.getSearchSuggestions(searchQuery);
  
  return result.fold(
    (error) => [],
    (suggestions) => suggestions,
  );
});

// Filtered Services Providers
final filteredNewUserServicesProvider = Provider.autoDispose<List<String>>((ref) {
  final query = ref.watch(newUserSearchQueryProvider);
  final allServices = ref.watch(newUserServicesProvider);
  
  return allServices.when(
    loading: () => [],
    error: (error, stack) => _filterServices(_getFallbackNewUserServices(), query),
    data: (services) => _filterServices(services, query),
  );
});

final filteredFinancialServicesProvider = Provider.autoDispose<List<String>>((ref) {
  final query = ref.watch(financialSearchQueryProvider);
  final allServices = ref.watch(financialServicesProvider);
  
  return allServices.when(
    loading: () => [],
    error: (error, stack) => _filterServices(_getFallbackFinancialServices(), query),
    data: (services) => _filterServices(services, query),
  );
});

// Helper Methods
List<String> _filterServices(List<String> services, String query) {
  if (query.isEmpty) return services;
  final lowerQuery = query.toLowerCase();
  return services.where((service) => service.toLowerCase().contains(lowerQuery)).toList();
}

List<String> _getFallbackOptions(String userType) {
  return userType == 'new_user' ? _getFallbackNewUserServices() : _getFallbackFinancialServices();
}

List<String> _getFallbackNewUserServices() {
  return [
    "Mobile Recharge", "Track Billers", "Credit Card Bills", "Offers",
    "Electricity Bill", "Water Bill", "Gas Bill", "DTH Recharge",
  ];
}

List<String> _getFallbackFinancialServices() {
  return [
    "Home Finance", "Instant Finance", "Car Finance", "Personal Finance",
    "Business Loans", "Investment Plans", "Loan Services", "Wealth Management",
  ];
}

// Whats New Features Provider
final whatsNewFeaturesProvider = FutureProvider.autoDispose<List<WhatsNewEntity>>((ref) async {
  final repository = ref.read(whatsNewRepositoryProvider);
  final result = await repository.getWhatsNewFeatures();
  
  return result.fold(
    (error) => _getFallbackWhatsNewFeatures(),
    (features) => features.isNotEmpty ? features : _getFallbackWhatsNewFeatures(),
  );
});

List<WhatsNewEntity> _getFallbackWhatsNewFeatures() {
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