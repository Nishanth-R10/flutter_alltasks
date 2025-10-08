// lib/features/search/providers/new_user_services_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final newUserServicesListProvider = Provider<List<String>>((ref) {
  return [
    "Mobile Recharge",
    "Track Billers", 
    "Credit card Bills",
    "Offers",
    "Your Cheque book",
    "Electricity Bill",
    "Water Bill",
    "Gas Bill",
    "DTH Recharge",
    "Broadband Bill",
    "Insurance Premium",
    "Loan Payment",
    "Postpaid Bill",
    "Landline Bill",
    "Municipal Tax",
    "Education Fee",
    "Fastag Recharge",
    "Cable TV Bill",
  ];
});

final newUserSearchQueryProvider = StateProvider<String>((ref) => '');

final filteredNewUserServicesProvider = Provider<List<String>>((ref) {
  final query = ref.watch(newUserSearchQueryProvider);
  final allServices = ref.watch(newUserServicesListProvider);
  
  if (query.isEmpty) {
    return allServices;
  }
  
  return allServices.where((service) {
    return service.toLowerCase().contains(query.toLowerCase());
  }).toList();
});