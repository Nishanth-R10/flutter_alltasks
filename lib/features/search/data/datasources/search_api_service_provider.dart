// lib/features/search/data/datasources/search_api_service_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/network/api_service.dart';
import 'search_api_service.dart';

final searchApiServiceProvider = Provider<SearchApiService>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return SearchApiService(apiService);
});