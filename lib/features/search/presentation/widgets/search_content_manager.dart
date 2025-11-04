import 'package:flutter/material.dart';
import 'package:tasks/features/search/application/search_user_provider.dart';
import 'package:tasks/features/search/presentation/widgets/financial_services/financial_services_result.dart';
import 'package:tasks/features/search/presentation/widgets/new_user/new_user_interface.dart';
import 'package:tasks/features/search/presentation/widgets/new_user/new_user_search_results.dart';
import 'package:tasks/features/search/presentation/widgets/returning_user/returning_user_interface.dart';

class SearchContentManager extends StatelessWidget {
  final bool isSearching;
  final UserType userType;
  final double baseSize;
  final TextEditingController searchController;
  final List<String> financialResults;
  final List<String> newUserResults;

  const SearchContentManager({
    super.key,
    required this.isSearching,
    required this.userType,
    required this.baseSize,
    required this.searchController,
    required this.financialResults,
    required this.newUserResults,
  });

  @override
  Widget build(BuildContext context) {
    if (isSearching) {
      if (userType == UserType.returningUser) {
        return FinancialServicesResults(
          searchResults: financialResults,
          searchController: searchController,
          baseSize: baseSize,
        );
      } else {
        return NewUserSearchResults(
          searchResults: newUserResults,
          searchController: searchController,
          baseSize: baseSize,
        );
      }
    } else {
      return userType == UserType.newUser
          ? NewUserInterface(searchController: searchController)
          : ReturningUserInterface(searchController: searchController);
    }
  }
}