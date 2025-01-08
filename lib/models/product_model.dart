// lib/models/product_model.dart
class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final int reviews;
  final String imageUrl;
  final String description;
  final String sellerId;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.description,
    required this.sellerId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviews: json['reviews'] as int? ?? 0,
      imageUrl: json['image_url'] as String? ?? '',
      description: json['description'] as String? ?? '',
      sellerId: json['seller_id'] as String,
    );
  }
}
