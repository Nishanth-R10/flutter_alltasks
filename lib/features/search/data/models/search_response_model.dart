class SearchResponseModel {
  final List<String> services;

  SearchResponseModel({required this.services});

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResponseModel(
      services: List<String>.from(json['services'] ?? []),
    );
  }
}