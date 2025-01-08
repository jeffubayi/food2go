// lib/models/farm_model.dart
class Farm {
  final String id;
  final String name;
  final String location;
  final double size;
  final String cropType;
  final String soilType;
  final Map<String, dynamic> currentData;

  Farm({
    required this.id,
    required this.name,
    required this.location,
    required this.size,
    required this.cropType,
    required this.soilType,
    required this.currentData,
  });

  factory Farm.fromJson(Map<String, dynamic> json) {
    return Farm(
      id: json['id'],
      name: json['farm_name'],
      location: json['location'],
      size: json['size'].toDouble(),
      cropType: json['crop_type'],
      soilType: json['soil_type'],
      currentData: json['current_data'] ?? {},
    );
  }
}
