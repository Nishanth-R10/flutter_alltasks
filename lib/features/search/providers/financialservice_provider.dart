// lib/features/search/providers/financialservice_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';

// Dummy API Response Provider
final financialServicesApiProvider = FutureProvider<Either<String, Map<String, dynamic>>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  
  // DUMMY API RESPONSE
  final dummyApiResponse = {
    "status": "success",
    "message": "Financial services retrieved successfully",
    "data": {
      "services": [
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
      ]
    }
  };
  
  return Right(dummyApiResponse);
});

final financialServicesListProvider = Provider<List<String>>((ref) {
  final apiResult = ref.watch(financialServicesApiProvider);
  
  return apiResult.when(
    loading: () => [],
    error: (error, stack) => [],
    data: (result) {
      return result.fold(
        (error) => [],
        (apiResponse) {
          final servicesData = apiResponse['data']['services'] as List<dynamic>;
          return servicesData.map((service) => service.toString()).toList();
        },
      );
    },
  );
});

// FIXED: Make sure this provider exists
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