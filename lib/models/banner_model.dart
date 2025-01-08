// lib/models/banner_model.dart
import 'dart:ui';

class BannerItem {
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;
  final Color backgroundColor;

  BannerItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    required this.backgroundColor,
  });
}
