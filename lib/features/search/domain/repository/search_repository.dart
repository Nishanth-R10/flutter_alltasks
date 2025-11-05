import '../entities/search_entity.dart';
import '../entities/whats_new_entity.dart';

abstract class SearchRepository {
  Future<List<String>> getSearchSuggestions(String query);
  Future<List<String>> getNewUserServices();
  Future<List<WhatsNewEntity>> getWhatsNewFeatures();
  
  // TODO: UNCOMMENT FOR RETURNING USER LATER
  /*
  Future<List<String>> getReturningUserServices();
  */
}