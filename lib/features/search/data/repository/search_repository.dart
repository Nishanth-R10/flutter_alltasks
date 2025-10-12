import 'package:tasks/core/constants/app_strings/default_string.dart';
import '../../domain/entities/search_entity.dart';

class SearchRepository {
  List<SearchEntity> getSearchSuggestions() {
    return [
      SearchEntity(title: DefaultString.instance.discoveryFeature, imagePath: "assets/images/discovery.png"),
      SearchEntity(title: DefaultString.instance.discoveryFeature, imagePath: "assets/images/discovery.png"),
    ];
  }
}