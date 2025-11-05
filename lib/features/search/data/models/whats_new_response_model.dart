class WhatsNewResponseModel {
  final List<Map<String, dynamic>> features;

  WhatsNewResponseModel({required this.features});

  factory WhatsNewResponseModel.fromJson(Map<String, dynamic> json) {
    return WhatsNewResponseModel(
      features: List<Map<String, dynamic>>.from(json['features'] ?? []),
    );
  }
}