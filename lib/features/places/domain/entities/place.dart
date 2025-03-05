import 'package:equatable/equatable.dart';
import 'category.dart';

class Place extends Equatable {
  final String id;
  final String name;
  final String description;
  final String address;
  final double rating;
  final int reviewCount;
  final List<String> imageUrls;
  final double latitude;
  final double longitude;
  final List<Category> categories;
  final bool isPopular;
  final bool isTrending;
  final DateTime createdAt;

  const Place({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.rating,
    required this.reviewCount,
    required this.imageUrls,
    required this.latitude,
    required this.longitude,
    required this.categories,
    this.isPopular = false,
    this.isTrending = false,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        address,
        rating,
        reviewCount,
        imageUrls,
        latitude,
        longitude,
        categories,
        isPopular,
        isTrending,
        createdAt,
      ];
}
