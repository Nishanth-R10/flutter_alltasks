// File: lib/features/search/data/repositories/search_repository.dart
import '../../domain/entities/search_entity.dart';

class SearchRepository {
  List<SearchEntity> getSearchSuggestions() {
    return [
      SearchEntity(title: "Discovery Feature", imagePath: "assets/images/discovery.png"),
      SearchEntity(title: "Discovery Feature", imagePath: "assets/images/discovery.png"),
    ];
  }
}