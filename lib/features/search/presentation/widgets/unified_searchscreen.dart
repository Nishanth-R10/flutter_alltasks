// lib/features/search/presentation/pages/unified_search_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tasks/features/home/application/user_provider.dart';
import 'package:tasks/features/search/presentation/widgets/common/search_bar.dart';
import 'package:tasks/features/search/presentation/widgets/unified_search/user_type_toggle.dart';
import 'package:tasks/features/search/presentation/widgets/unified_search/search_content_manager.dart';
import 'package:tasks/features/search/providers/financialservice_provider.dart';
import 'package:tasks/features/search/providers/new_user_provider.dart';

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
    
    ref.read(financialSearchQueryProvider.notifier).state = query;
    ref.read(newUserSearchQueryProvider.notifier).state = query;
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _isSearching = false;
    });
    
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
              ),
              SizedBox(height: baseSize * 3),
              
              Expanded(
                child: SearchContentManager(
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}