// lib/features/search/presentation/pages/unified_search_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fpdart/fpdart.dart';
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

  // Dummy API Service for Search
  Future<Either<String, Map<String, dynamic>>> _fetchSearchData() async {
    try {
      print('🔄 Fetching search configuration from API...');
      
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));
      
      // DUMMY API RESPONSE (structured like real API)
      final dummyApiResponse = {
        "status": "success",
        "message": "Search configuration loaded successfully",
        "data": {
          "userType": "dynamic",
          "features": ["search", "suggestions", "filtering"],
          "timestamp": DateTime.now().toIso8601String(),
          "version": "1.0.0"
        }
      };
      
      print('✅ Search API Success: Configuration loaded');
      return Right(dummyApiResponse);
      
    } catch (e) {
      print('❌ Search API Error: $e');
      return Left('Search API Error: $e');
    }
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
              // API Status Indicator
              Consumer(
                builder: (context, ref, child) {
                  final searchApi = _fetchSearchData();
                  
                  return FutureBuilder<Either<String, Map<String, dynamic>>>(
                    future: searchApi,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: baseSize * 2),
                          child: Row(
                            children: [
                              Icon(Icons.cloud_download, size: baseSize * 4, color: Colors.blue),
                              SizedBox(width: baseSize * 2),
                              Text(
                                'Loading search configuration from API...',
                                style: TextStyle(
                                  fontSize: baseSize * 3,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      
                      if (snapshot.hasError) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: baseSize * 2),
                          child: Row(
                            children: [
                              Icon(Icons.error_outline, size: baseSize * 4, color: Colors.red),
                              SizedBox(width: baseSize * 2),
                              Text(
                                'API Error: ${snapshot.error}',
                                style: TextStyle(
                                  fontSize: baseSize * 2.8,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      
                      final result = snapshot.data;
                      return result?.fold(
                        (error) => Padding(
                          padding: EdgeInsets.only(bottom: baseSize * 2),
                          child: Row(
                            children: [
                              Icon(Icons.error_outline, size: baseSize * 4, color: Colors.red),
                              SizedBox(width: baseSize * 2),
                              Text(
                                'API: $error',
                                style: TextStyle(
                                  fontSize: baseSize * 2.8,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        (apiResponse) => Padding(
                          padding: EdgeInsets.only(bottom: baseSize * 2),
                          child: Row(
                            children: [
                              Icon(Icons.cloud_done, size: baseSize * 4, color: Colors.green),
                              SizedBox(width: baseSize * 2),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '✅ ${apiResponse['message']}',
                                    style: TextStyle(
                                      fontSize: baseSize * 2.8,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'User Type: ${userType == UserType.newUser ? 'New User' : 'Returning User'}',
                                    style: TextStyle(
                                      fontSize: baseSize * 2.5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ) ?? SizedBox.shrink();
                    },
                  );
                },
              ),
              
              UserTypeToggle(baseSize: baseSize),
              SizedBox(height: baseSize * 3),
              
              // Search Services API Status
              Consumer(
                builder: (context, ref, child) {
                  final financialApi = ref.watch(financialServicesApiProvider);
                  final newUserApi = ref.watch(newUserServicesApiProvider);
                  
                  return financialApi.when(
                    loading: () => Padding(
                      padding: EdgeInsets.only(bottom: baseSize * 2),
                      child: Row(
                        children: [
                          Icon(Icons.downloading, size: baseSize * 3.5, color: Colors.orange),
                          SizedBox(width: baseSize * 2),
                          Text(
                            'Loading services data...',
                            style: TextStyle(
                              fontSize: baseSize * 2.8,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                    error: (error, stack) => Padding(
                      padding: EdgeInsets.only(bottom: baseSize * 2),
                      child: Row(
                        children: [
                          Icon(Icons.warning, size: baseSize * 3.5, color: Colors.red),
                          SizedBox(width: baseSize * 2),
                          Text(
                            'Failed to load services',
                            style: TextStyle(
                              fontSize: baseSize * 2.8,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    data: (result) => result.fold(
                      (error) => Padding(
                        padding: EdgeInsets.only(bottom: baseSize * 2),
                        child: Row(
                          children: [
                            Icon(Icons.warning, size: baseSize * 3.5, color: Colors.red),
                            SizedBox(width: baseSize * 2),
                            Text(
                              'Services API Error',
                              style: TextStyle(
                                fontSize: baseSize * 2.8,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      (apiResponse) {
                        final servicesCount = userType == UserType.newUser 
                            ? newUserSearchResults.length 
                            : financialSearchResults.length;
                            
                        return Padding(
                          padding: EdgeInsets.only(bottom: baseSize * 2),
                          child: Row(
                            children: [
                              Icon(Icons.check_circle, size: baseSize * 3.5, color: Colors.green),
                              SizedBox(width: baseSize * 2),
                              Text(
                                '📡 ${apiResponse['message']} • $servicesCount services available',
                                style: TextStyle(
                                  fontSize: baseSize * 2.8,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              
              SearchBarWidget(
                controller: _searchController,
                onCancel: _onCancel,
                onClear: _clearSearch,
                baseSize: baseSize,
                showSearchResults: true,
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