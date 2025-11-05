class SearchEntity {
  final String id;
  final String title;
  final String? description;
  final String? type;
  final String? imageUrl;

  const SearchEntity({
    required this.id,
    required this.title,
    this.description,
    this.type,
    this.imageUrl,
  });

  factory SearchEntity.fromJson(Map<String, dynamic> json) {
    return SearchEntity(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString(),
      type: json['type']?.toString(),
      imageUrl: json['imageUrl']?.toString() ?? json['imagePath']?.toString(),
    );
  }
}