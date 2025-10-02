// File: lib/features/search/providers/financial_services_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final financialServicesListProvider = Provider<List<String>>((ref) {
  return [
      "Financial Services",
    "Instant Finance", 
    "Home Finance",
    "Car Finance",
    "Personal Finance",
    "Business Loans",
    "Investment Plans",
    "Loan Services",
    "Mortgage Services",
    "Credit Services",
    "Banking Services",
    "Wealth Management",
    "Insurance Services",
    "Retirement Planning",
  ];
});

final financialSearchQueryProvider = StateProvider<String>((ref) => '');

final filteredFinancialServicesProvider = Provider<List<String>>((ref) {
  final query = ref.watch(financialSearchQueryProvider);
  final allServices = ref.watch(financialServicesListProvider);
  
  if (query.isEmpty) {
    return allServices;
  }
  
  return allServices.where((service) {
    return service.toLowerCase().contains(query.toLowerCase());
  }).toList();
});