import 'package:coffee_shop/core/extension/build_context_extension.dart';
import 'package:coffee_shop/core/intl/intl_currency.dart';
import 'package:coffee_shop/domain/models/coffee.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final Coffee coffee;

  const ProductInfo({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coffee.name,
          style: context.textStyle.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          coffee.shortDescription,
          style: TextStyle(color: Colors.grey.shade500),
        ),
        const SizedBox(height: 12.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow.shade800,
              size: 20.0,
            ),
            const SizedBox(width: 4.0),
            Text(
              coffee.rating.toStringAsFixed(1),
              style: context.textStyle.bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              "(${coffee.ratingCount.inCompact})",
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
