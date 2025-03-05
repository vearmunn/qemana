import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String icon;
  final String description;
  final int locationCount;
  final String? imageUrl;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.locationCount,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        icon,
        description,
        locationCount,
        imageUrl,
      ];

  // Predefined categories
  static const Category restaurant = Category(
    id: 'restaurant',
    name: 'Restoran & Cafe',
    icon: 'dish-02.png',
    description: 'Restaurants and cafes',
    locationCount: 0,
  );

  static const Category shopping = Category(
    id: 'shopping',
    name: 'Pusat Perbelanjaan',
    icon: 'bag alt.png',
    description: 'Shopping centers and malls',
    locationCount: 0,
  );

  static const Category monument = Category(
    id: 'monument',
    name: 'Monumen & Budaya',
    icon: 'lighthouse.png',
    description: 'Monuments and cultural sites',
    locationCount: 0,
  );

  // Add other categories as needed...
}
