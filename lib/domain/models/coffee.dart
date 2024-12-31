import 'package:coffee_shop/core/exceptions/entity_exception.dart';
import 'package:coffee_shop/data/entities/coffee_entity.dart';

enum CoffeeType { black, white, chocolate }

class Coffee {
  final String id;
  final String name;
  final String shortDescription;
  final String description;
  final String imageUrl;
  final CoffeeType type;
  final double price;
  final double rating;
  final int ratingCount;

  Coffee({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.price,
    required this.rating,
    required this.ratingCount,
  });

  factory Coffee.fromEntity(CoffeeEntity entity) {
    return Coffee(
      id: entity.id,
      name: entity.name,
      shortDescription: entity.shortDescription,
      description: entity.description,
      imageUrl: entity.imageUrl,
      type: switch(entity.type) {
        0 => CoffeeType.black,
        1 => CoffeeType.white,
        2 => CoffeeType.chocolate,
        _ => throw InvalidEntityException(),
      },
      price: entity.price,
      rating: entity.rating,
      ratingCount: entity.ratingCount,
    );
  }
}
