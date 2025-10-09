import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';

final newUserServicesListProvider = Provider<List<String>>((ref) {
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