class SearchEntity {
  final String title;
  final String imagePath;
  final String id;
  final String type;

  SearchEntity({
    required this.title,
    required this.imagePath,
    required this.id,
    required this.type,
  });

  factory SearchEntity.fromJson(Map<String, dynamic> json) {
    return SearchEntity(
      id: json['id']?.toString() ?? '',
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imagePath': imagePath,
      'type': type,
    };
  }
}