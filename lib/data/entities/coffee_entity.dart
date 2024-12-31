import 'package:json_annotation/json_annotation.dart';

part 'coffee_entity.g.dart';

@JsonSerializable()
class CoffeeEntity {
  final String id;
  final String name;
  final String shortDescription;
  final String description;
  final String imageUrl;
  final int type;
  final double price;
  final double rating;
  final int ratingCount;

  CoffeeEntity({
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

  factory CoffeeEntity.fromJson(Map<String, dynamic> json) => _$CoffeeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CoffeeEntityToJson(this);
}