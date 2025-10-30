// lib/features/search/presentation/widgets/unified_searchscreen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tasks/features/home/application/user_provider.dart';
import 'package:tasks/features/search/presentation/widgets/common/search_bar.dart';
import 'package:tasks/features/search/presentation/widgets/unified_search/user_type_toggle.dart';
import 'package:tasks/features/search/presentation/widgets/unified_search/search_content_manager.dart';
import 'package:tasks/features/search/providers/search_providers.dart';

@RoutePage()
class UnifiedSearchScreen extends ConsumerStatefulWidget {
  const UnifiedSearchScreen({super.key});

  @override
  ConsumerState<UnifiedSearchScreen> createState() => _UnifiedSearchScreenState();
}

class _UnifiedSearchScreenState extends ConsumerState<UnifiedSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    setState(() {
      _isSearching = query.isNotEmpty;
    });
    
    // Update the correct provider based on current user type
    final userType = ref.read(userTypeProvider);
    if (userType == UserType.newUser) {
      ref.read(newUserSearchQueryProvider.notifier).state = query;
    } else {
      ref.read(financialSearchQueryProvider.notifier).state = query;
    }
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _isSearching = false;
    });
    
    // Clear both providers
    ref.read(financialSearchQueryProvider.notifier).state = '';
    ref.read(newUserSearchQueryProvider.notifier).state = '';
  }

  void _onCancel() {
    context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    final userType = ref.watch(userTypeProvider);
    final Size screenSize = MediaQuery.of(context).size;
    final double baseSize = screenSize.width * 0.01;
    
    // ✅ ADD THESE - Get the results from providers
    final financialSearchResults = ref.watch(filteredFinancialServicesProvider);
    final newUserSearchResults = ref.watch(filteredNewUserServicesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(baseSize * 4),
          child: Column(
            children: [
              UserTypeToggle(baseSize: baseSize),
              SizedBox(height: baseSize * 3),
              
              SearchBarWidget(
                controller: _searchController,
                onCancel: _onCancel,
                onClear: _clearSearch,
                baseSize: baseSize,
                showSearchResults: true,
                isNewUser: userType == UserType.newUser,
              ),
              SizedBox(height: baseSize * 3),
              
              // Search Results Count
              if (_isSearching)
                Padding(
                  padding: EdgeInsets.only(bottom: baseSize * 2),
                  child: Row(
                    children: [
                      Icon(Icons.search, size: baseSize * 4, color: Colors.blue),
                      SizedBox(width: baseSize * 2),
                      Text(
                        userType == UserType.newUser
                            ? 'Found ${newUserSearchResults.length} results for "${_searchController.text}"'
                            : 'Found ${financialSearchResults.length} results for "${_searchController.text}"',
                        style: TextStyle(
                          fontSize: baseSize * 3,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              
              Expanded(
                child: _isSearching 
                    ? _buildRealSearchResults(baseSize, userType, financialSearchResults, newUserSearchResults)
                    : SearchContentManager(
                        isSearching: _isSearching,
                        userType: userType,
                        baseSize: baseSize,
                        searchController: _searchController,
                        financialResults: financialSearchResults, 
                        newUserResults: newUserSearchResults, 
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ UPDATE THIS METHOD TO ACCEPT PARAMETERS
  Widget _buildRealSearchResults(
    double baseSize, 
    UserType userType, 
    List<String> financialResults, 
    List<String> newUserResults
  ) {
    final searchQuery = _searchController.text.trim();
    
    if (searchQuery.isEmpty) {
      return Center(
        child: Text(
          'Type to start searching...',
          style: TextStyle(
            fontSize: baseSize * 3.5,
            color: Colors.grey.shade500,
          ),
        ),
      );
    }

    return SearchContentManager(
      isSearching: true,
      userType: userType,
      baseSize: baseSize,
      searchController: _searchController,
      financialResults: financialResults, // ✅ ADD THIS
      newUserResults: newUserResults, // ✅ ADD THIS
    );
  }

  @override 
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}