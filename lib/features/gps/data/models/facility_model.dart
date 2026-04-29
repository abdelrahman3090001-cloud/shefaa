class FacilityModel {
  final String name;
  final String distance;
  final String rating;
  final String? type;
  final bool isOpen;

  FacilityModel({
    required this.name,
    required this.distance,
    required this.rating,
    this.type,
    this.isOpen = true,
  });

  factory FacilityModel.fromJson(Map<String, dynamic> json) {
    return FacilityModel(
      name: json['name'] ?? '',
      distance: json['distance'] ?? '',
      rating: json['rating'] ?? '0.0',
      type: json['type'],
      isOpen: json['isOpen'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'distance': distance,
      'rating': rating,
      'type': type,
      'isOpen': isOpen,
    };
  }
}
