import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/search/presentation/controller/search_results_provider.dart';
import 'package:tasks/features/search/presentation/controller/search_state_provider.dart';
import '../widgets/search_content_manager.dart';
import '../widgets/search_bar.dart';
// import '../widgets/user_type_toggle.dart'; // COMMENTED FOR NOW

@RoutePage()
class UnifiedSearchScreen extends ConsumerStatefulWidget {
  const UnifiedSearchScreen({super.key});

  @override
  ConsumerState<UnifiedSearchScreen> createState() => _UnifiedSearchScreenState();
}

class _UnifiedSearchScreenState extends ConsumerState<UnifiedSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onClearSearch() {
    _searchController.clear();
    ref.read(searchQueryProvider.notifier).state = '';
  }

  void _onCancelSearch() {
    Navigator.of(context).pop();
  }

  bool get _isSearching => _searchController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size.shortestSide * 0.01;
    final searchResults = ref.watch(searchResultsProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //  
      // ),
      body: Padding(
        padding: EdgeInsets.only(
          top: baseSize * 9, //  padding to push search bar lower 
          left: baseSize * 5,
          right: baseSize * 2,
          bottom: baseSize * 2,
        ),
        child: Column(
          children: [
            // Search bar positioned lower
            SearchBarWidget(
              controller: _searchController,
              onCancel: _onCancelSearch,
              onClear: _onClearSearch,
              baseSize: baseSize,
            ),
            SizedBox(height: baseSize * 4),
            
            // Search content
            Expanded(
              child: SearchContentManager(
                isSearching: _isSearching,
                baseSize: baseSize,
                searchController: _searchController,
                searchResults: searchResults,
              ),
            ),
          ],
        ),
      ),
    );
  }
}