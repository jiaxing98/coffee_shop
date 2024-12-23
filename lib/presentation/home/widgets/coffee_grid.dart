import 'package:coffee_shop/domain/models/coffee.dart';
import 'package:coffee_shop/presentation/home/widgets/coffee_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CoffeeGrid extends StatelessWidget {
  final List<Coffee> coffee;
  final bool isLoading;
  final void Function(Coffee)? onTap;

  const CoffeeGrid._({
    super.key,
    required this.coffee,
    required this.isLoading,
    required this.onTap,
  });

  const CoffeeGrid({
    super.key,
    required this.coffee,
    required this.onTap,
  }) : isLoading = false;

  factory CoffeeGrid.loading() {
    return CoffeeGrid._(
      coffee: List.generate(
        4,
        (index) => Coffee(
          id: "id $index",
          name: "name",
          shortDescription: "shortDescription",
          description: "description",
          imageUrl: "imageUrl",
          type: CoffeeType.white,
          price: 0.0,
          rating: 0.0,
          ratingCount: 0,
        ),
      ),
      isLoading: true,
      onTap: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      enabled: isLoading,
      child: SliverPadding(
        padding: const EdgeInsets.all(16.0),
        sliver: SliverGrid.count(
          crossAxisCount: 2,
          childAspectRatio: 3 / 5,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: coffee.map((e) => CoffeeItem(coffee: e, onTap: onTap)).toList(),
        ),
      ),
    );
  }
}
