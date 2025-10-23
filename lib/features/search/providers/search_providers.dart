// lib/features/search/application/search_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tasks/core/network/api_service.dart';
import 'package:tasks/features/profile/presentation/controller/app_providers.dart';
import 'package:tasks/features/search/data/repository/search_repository.dart';
import 'package:tasks/features/search/data/repository/search_repository_impl.dart';
import 'package:tasks/features/search/data/repository/whats_new_repository.dart';
import 'package:tasks/features/search/data/repository/whats_new_repository_impl.dart';
import 'package:tasks/features/search/domain/entities/search_entity.dart';
import 'package:tasks/features/search/domain/entities/whats_new_entity.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';

// Dio Client (shared with profile)
final dioClientProvider = Provider<ApiService>((ref) {
  return ref.read(api);
});

// Repositories
final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepositoryImpl(ref.read(dioClientProvider));
});

final whatsNewRepositoryProvider = Provider<WhatsNewRepository>((ref) {
  return WhatsNewRepositoryImpl(ref.read(dioClientProvider));
});

// Search State Providers
final newUserSearchQueryProvider = StateProvider<String>((ref) => '');
final financialSearchQueryProvider = StateProvider<String>((ref) => '');

// Search Suggestions Provider
final searchSuggestionsProvider = FutureProvider.autoDispose
    .family<List<SearchEntity>, String>((ref, searchQuery) async {
  if (searchQuery.isEmpty) {
    return [];
  }
  
  final repository = ref.read(searchRepositoryProvider);
  final result = await repository.getSearchSuggestions(searchQuery);
  
  return result.fold(
    (error) => [], // Return empty list on error
    (suggestions) => suggestions,
  );
});

// Search Options Provider
final searchOptionsProvider = FutureProvider.autoDispose
    .family<List<String>, String>((ref, userType) async {
  final repository = ref.read(searchRepositoryProvider);
  final result = await repository.getSearchOptions(userType);
  
  return result.fold(
    (error) => _getFallbackOptions(userType), // Return fallback on error
    (options) => options,
  );
});

// Whats New Features Provider
final whatsNewFeaturesProvider = FutureProvider.autoDispose<List<WhatsNewEntity>>((ref) async {
  final repository = ref.read(whatsNewRepositoryProvider);
  final result = await repository.getWhatsNewFeatures();
  
  return result.fold(
    (error) => _getFallbackWhatsNewFeatures(), // Return fallback on error
    (features) => features.isNotEmpty ? features : _getFallbackWhatsNewFeatures(),
  );
});

// New User Services Provider -  Direct repository call
final newUserServicesProvider = FutureProvider.autoDispose<List<String>>((ref) async {
  final repository = ref.read(searchRepositoryProvider);
  final result = await repository.getSearchOptions('new_user');
  
  return result.fold(
    (error) => _getFallbackNewUserServices(),
    (options) => options.isNotEmpty ? options : _getFallbackNewUserServices(),
  );
});

// Financial Services Provider - FIXED: Direct repository call
final financialServicesProvider = FutureProvider.autoDispose<List<String>>((ref) async {
  final repository = ref.read(searchRepositoryProvider);
  final result = await repository.getSearchOptions('returning_user');
  
  return result.fold(
    (error) => _getFallbackFinancialServices(),
    (options) => options.isNotEmpty ? options : _getFallbackFinancialServices(),
  );
});

// Filtered New User Services
final filteredNewUserServicesProvider = Provider.autoDispose<List<String>>((ref) {
  final query = ref.watch(newUserSearchQueryProvider);
  final allServicesAsync = ref.watch(newUserServicesProvider);
  
  return allServicesAsync.when(
    loading: () => [],
    error: (error, stack) => _getFallbackNewUserServices(),
    data: (allServices) {
      if (query.isEmpty) {
        return allServices.isNotEmpty ? allServices : _getFallbackNewUserServices();
      }
      
      return allServices.where((service) {
        return service.toLowerCase().contains(query.toLowerCase());
      }).toList();
    },
  );
});

// Filtered Financial Services
final filteredFinancialServicesProvider = Provider.autoDispose<List<String>>((ref) {
  final query = ref.watch(financialSearchQueryProvider);
  final allServicesAsync = ref.watch(financialServicesProvider);
  
  return allServicesAsync.when(
    loading: () => [],
    error: (error, stack) => _getFallbackFinancialServices(),
    data: (allServices) {
      if (query.isEmpty) {
        return allServices.isNotEmpty ? allServices : _getFallbackFinancialServices();
      }
      
      return allServices.where((service) {
        return service.toLowerCase().contains(query.toLowerCase());
      }).toList();
    },
  );
});

// Fallback Data
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

List<String> _getFallbackOptions(String userType) {
  return userType == 'new_user'
      ? _getFallbackNewUserServices()
      : _getFallbackFinancialServices();
}

List<String> _getFallbackNewUserServices() {
  return [
    DefaultString.instance.mobileRecharge,
    DefaultString.instance.trackBillers, 
    DefaultString.instance.creditCardBills,
    DefaultString.instance.offersSearch,
    DefaultString.instance.yourChequeBook,
    DefaultString.instance.electricityBill,
    DefaultString.instance.waterBill,
    DefaultString.instance.gasBill,
    DefaultString.instance.dthRecharge,
    DefaultString.instance.broadbandBill,
    DefaultString.instance.insurancePremium,
    DefaultString.instance.loanPayment,
    DefaultString.instance.postpaidBill,
    DefaultString.instance.landlineBill,
    DefaultString.instance.municipalTax,
    DefaultString.instance.educationFee,
    DefaultString.instance.fastagRecharge,
    DefaultString.instance.cableTvBill,
  ];
}

List<String> _getFallbackFinancialServices() {
  return [
    DefaultString.instance.financialServices,
    DefaultString.instance.instantFinance, 
    DefaultString.instance.homeFinance,
    DefaultString.instance.carFinance,
    DefaultString.instance.personalFinance,
    DefaultString.instance.businessLoans,
    DefaultString.instance.investmentPlans,
    DefaultString.instance.loanServices,
    DefaultString.instance.mortgageServices,
    DefaultString.instance.creditServices,
    DefaultString.instance.bankingServices,
    DefaultString.instance.wealthManagement,
    DefaultString.instance.insuranceServices,
    DefaultString.instance.retirementPlanning,
  ];
}