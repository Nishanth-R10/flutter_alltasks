import 'package:fpdart/fpdart.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import '../../domain/entities/search_entity.dart';

class SearchRepository {
  
  Future<Either<String, List<SearchEntity>>> getSearchSuggestions() async {
    try {
      print('🔄 Fetching search suggestions from API...');
      
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));
      
      // DUMMY API RESPONSE (structured like real API)
      final dummyApiResponse = {
        "status": "success",
        "message": "Search suggestions retrieved successfully",
        "data": {
          "suggestions": [
            {
              "id": "1",
              "title": DefaultString.instance.discoveryFeature,
              "imagePath": "assets/images/discovery.png",
              "type": "feature"
            },
            {
              "id": "2", 
              "title": DefaultString.instance.discoveryFeature,
              "imagePath": "assets/images/discovery.png",
              "type": "feature"
            }
          ]
        }
      };
      
      // Parse the DUMMY API response like real API
      final suggestions = _parseApiResponse(dummyApiResponse);
      print('✅ Dummy API Success: ${suggestions.length} search suggestions loaded');
      return Right(suggestions);
      
    } catch (e) {
      print('❌ Dummy API Error: $e');
      return Left('API Error: $e');
    }
  }

  List<SearchEntity> _parseApiResponse(Map<String, dynamic> apiResponse) {
    try {
      // Parse like real API response structure
      final List<dynamic> suggestionsData = apiResponse['data']['suggestions'];
      
      return suggestionsData.map((suggestionJson) {
        return SearchEntity.fromJson(suggestionJson);
      }).toList();
    } catch (e) {
      print('❌ Parsing error: $e');
      throw Exception('Failed to parse API response: $e');
    }
  }
}