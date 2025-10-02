// File: lib/features/search/presentation/pages/financial_services_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/search/presentation/widgets/financial_services/finacial_services_search.dart';
import 'package:tasks/features/search/presentation/widgets/financial_services/financial_services_result.dart';
import 'package:tasks/features/search/providers/financialservice_provider.dart';


@RoutePage()
class FinancialServicesScreen extends ConsumerStatefulWidget {
  const FinancialServicesScreen({super.key});

  @override
  ConsumerState<FinancialServicesScreen> createState() => _FinancialServicesScreenState();
}

class _FinancialServicesScreenState extends ConsumerState<FinancialServicesScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    ref.read(financialSearchQueryProvider.notifier).state = _searchController.text;
  }

  void _clearSearch() {
    _searchController.clear();
    ref.read(financialSearchQueryProvider.notifier).state = '';
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double baseSize = screenSize.width * 0.01;
    final searchResults = ref.watch(filteredFinancialServicesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(baseSize * 4),
          child: Column(
            children: [
              FinancialServicesSearchBar(
                controller: _searchController,
                baseSize: baseSize,
                onClear: _clearSearch,
              ),
              SizedBox(height: baseSize * 3),
              Expanded(
                child: FinancialServicesResults(
                  searchResults: searchResults,
                  searchController: _searchController,
                  baseSize: baseSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}