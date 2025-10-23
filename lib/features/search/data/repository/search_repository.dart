// lib/features/search/data/repository/search_repository.dart
import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/search/domain/entities/search_entity.dart';

abstract class SearchRepository {
  Future<Either<String, List<SearchEntity>>> getSearchSuggestions(String searchQuery);
  Future<Either<String, List<String>>> getSearchOptions(String userType);
}