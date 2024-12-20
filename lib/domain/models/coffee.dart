enum CoffeeType { black, white, chocolate }

class Coffee {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final CoffeeType type;
  final double price;
  final double rating;

  Coffee({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.price,
    required this.rating,
  });
}
