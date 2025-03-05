class Place {
  final String name;
  final String openingHours;
  final bool isOpen;
  final double rating;
  final double distance;
  final String category;

  Place({
    required this.name,
    required this.openingHours,
    required this.isOpen,
    required this.rating,
    required this.distance,
    required this.category,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      openingHours: json['openingHours'],
      isOpen: json['isOpen'],
      rating: json['rating'].toDouble(),
      distance: json['distance'].toDouble(),
      category: json['category'],
    );
  }
}
