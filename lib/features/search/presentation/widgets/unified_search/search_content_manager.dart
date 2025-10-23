<<<<<<< HEAD
// lib/features/search/presentation/widgets/unified_search/search_content_manager.dart
import 'package:flutter/material.dart';
import 'package:tasks/features/home/application/user_provider.dart';
import 'package:tasks/features/search/presentation/widgets/financial_services/financial_services_result.dart';
import 'package:tasks/features/search/presentation/widgets/unified_search/new_user_interface.dart';
import 'package:tasks/features/search/presentation/widgets/unified_search/returning_user_interface.dart';
import 'package:tasks/features/search/presentation/widgets/unified_search/new_user_search_results.dart'; // ONLY ADDITION

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
          ? NewUserInterface( searchController: searchController)
          : ReturningUserInterface( searchController: searchController);
    }
  }
=======
// lib/features/search/presentation/widgets/unified_search/search_content_manager.dart
import 'package:flutter/material.dart';
import 'package:tasks/features/home/application/user_provider.dart';
import 'package:tasks/features/search/presentation/widgets/financial_services/financial_services_result.dart';
import 'package:tasks/features/search/presentation/widgets/unified_search/new_user_interface.dart';
import 'package:tasks/features/search/presentation/widgets/unified_search/returning_user_interface.dart';
import 'package:tasks/features/search/presentation/widgets/unified_search/new_user_search_results.dart';

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
          ? NewUserInterface(baseSize: baseSize, searchController: searchController)
          : ReturningUserInterface(baseSize: baseSize, searchController: searchController);
    }
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}