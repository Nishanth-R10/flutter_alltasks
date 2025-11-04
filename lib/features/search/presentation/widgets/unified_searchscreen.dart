// lib/features/search/presentation/widgets/unified_searchscreen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/search/application/search_user_provider.dart';
import 'package:tasks/features/search/presentation/search_provider.dart';
import 'search_content_manager.dart';
import 'search_bar.dart';
import 'user_type_toggle.dart';

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
    ref.read(newUserSearchQueryProvider.notifier).state = '';
    ref.read(financialSearchQueryProvider.notifier).state = '';
  }

  void _onCancelSearch() {
    Navigator.of(context).pop();
  }

  bool get _isSearching => _searchController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final userType = ref.watch(userTypeProvider);
    final baseSize = MediaQuery.of(context).size.shortestSide * 0.01;
    
    // Watch the filtered results based on user type
    final newUserResults = ref.watch(filteredNewUserServicesProvider);
    final financialResults = ref.watch(filteredFinancialServicesProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: UserTypeToggle(baseSize: baseSize), // ← TOGGLE 
      ),
      body: Padding(
        padding: EdgeInsets.all(baseSize * 3),
        child: Column(
          children: [
            // Search Bar 
            SearchBarWidget(
              controller: _searchController,
              onCancel: _onCancelSearch,
              onClear: _onClearSearch,
              baseSize: baseSize,
              showSearchResults: _isSearching,
              isNewUser: userType == UserType.newUser,
            ),
            SizedBox(height: baseSize * 3),
            
            // Search Content
            Expanded(
              child: SearchContentManager(
                isSearching: _isSearching,
                userType: userType,
                baseSize: baseSize,
                searchController: _searchController,
                financialResults: financialResults,
                newUserResults: newUserResults,
              ),
            ),
          ],
        ),
      ),
    );
  }
}