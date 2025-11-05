class WhatsNewEntity {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final String type;

  const WhatsNewEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.type,
  });

  factory WhatsNewEntity.fromJson(Map<String, dynamic> json) {
    return WhatsNewEntity(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      imagePath: json['imagePath']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
    );
  }
}