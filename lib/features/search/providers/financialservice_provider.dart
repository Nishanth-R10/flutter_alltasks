import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';

final financialServicesListProvider = Provider<List<String>>((ref) {
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