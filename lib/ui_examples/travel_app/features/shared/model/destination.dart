import 'dart:convert';

// TODO: add description variable

class Destination {
  final String name;
  final String continent;
  final String description;
  final double price;
  final double temperature;
  final double rating;
  final int flightDuration;
  final String image;

  const Destination({
    required this.name,
    required this.continent,
    required this.description,
    required this.price,
    required this.temperature,
    required this.rating,
    required this.flightDuration,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'continent': continent,
      'description': description,
      'price': price,
      'temperature': temperature,
      'rating': rating,
      'flightDuration': flightDuration,
      'image': image,
    };
  }

  factory Destination.fromMap(Map<String, dynamic> map) {
    return Destination(
      name: map['name'] ?? '',
      continent: map['continent'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      temperature: map['temperature']?.toDouble() ?? 0.0,
      rating: map['rating']?.toDouble() ?? 0.0,
      flightDuration: map['flightDuration']?.toInt() ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Destination.fromJson(String source) => Destination.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Destination(name: $name, continent: $continent, description: $description, price: $price, temperature: $temperature, rating: $rating, flightDuration: $flightDuration, image: $image)';
  }
}
