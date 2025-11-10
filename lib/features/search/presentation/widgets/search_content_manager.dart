// lib/features/search/presentation/widgets/search_content_manager.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors/default_colors.dart';
import 'new_user_interface.dart';
import 'new_user_search_results.dart';

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
    if (isSearching) {
      return searchResults.when(
        loading: () => _buildLoadingState(context),
        error: (error, stack) => _buildErrorState(context, error),
        data: (results) => NewUserSearchResults(
          searchResults: results,
          searchController: searchController,
          baseSize: baseSize,
        ),
      );
    } else {
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
            color: DefaultColors.grayCA,
          ),
          SizedBox(height: baseSize * 2),
          Text(
            'Failed to load results',
            style: TextStyle(
              fontSize: baseSize * 4,
              color: DefaultColors.gray62,
            ),
          ),
        ],
      ),
    );
  }
}