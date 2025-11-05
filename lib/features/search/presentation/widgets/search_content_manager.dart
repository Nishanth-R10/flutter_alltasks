import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'new_user_interface.dart';
import 'new_user_search_results.dart';
// import 'returning_user_interface.dart'; // COMMENTED FOR NOW
// import 'financial_services_result.dart'; // COMMENTED FOR NOW

class SearchContentManager extends ConsumerWidget {
  final bool isSearching;
  final double baseSize;
  final TextEditingController searchController;
  final AsyncValue<List<String>> searchResults;

  const SearchContentManager({
    super.key,
    required this.isSearching,
    required this.baseSize,
    required this.searchController,
    required this.searchResults,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: UNCOMMENT WHEN ADDING USER TYPE TOGGLE LATER
    // final userType = ref.watch(userTypeProvider);
    
    // For now, always show New User interface
    const userType = UserType.newUser; // Hardcoded for now

    if (isSearching) {
      // TODO: UNCOMMENT WHEN ADDING RETURNING USER LATER
      /*
      if (userType == UserType.returningUser) {
        final returningResults = ref.watch(returningUserSearchResultsProvider);
        return returningResults.when(
          loading: () => _buildLoadingState(context),
          error: (error, stack) => _buildErrorState(context, error),
          data: (results) => FinancialServicesResults(
            searchResults: results,
            searchController: searchController,
            baseSize: baseSize,
          ),
        );
      } else {
      */
        return searchResults.when(
          loading: () => _buildLoadingState(context),
          error: (error, stack) => _buildErrorState(context, error),
          data: (results) => NewUserSearchResults(
            searchResults: results,
            searchController: searchController,
            baseSize: baseSize,
          ),
        );
      // } // COMMENTED FOR NOW
    } else {
      // TODO: UNCOMMENT WHEN ADDING RETURNING USER LATER
      /*
      return userType == UserType.newUser
          ? NewUserInterface(searchController: searchController)
          : ReturningUserInterface(searchController: searchController);
      */
      
      // For now, always show New User interface
      return NewUserInterface(searchController: searchController);
    }
  }

  Widget _buildLoadingState(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: baseSize * 15,
            color: Colors.grey.shade400,
          ),
          SizedBox(height: baseSize * 2),
          Text(
            'Failed to load results',
            style: TextStyle(
              fontSize: baseSize * 4,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

// TODO: MOVE TO SEPARATE FILE WHEN UNCOMMENTING USER TYPE TOGGLE
enum UserType {
  newUser,
  returningUser,
}