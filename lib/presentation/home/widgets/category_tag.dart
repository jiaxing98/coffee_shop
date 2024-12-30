import 'package:coffee_shop/core/extensions/build_context.dart';
import 'package:coffee_shop/domain/models/coffee.dart';
import 'package:flutter/material.dart';

class CategoryTag extends StatefulWidget {
  final CoffeeType coffeeType;
  final void Function(bool)? onTap;

  const CategoryTag({
    super.key,
    required this.coffeeType,
    this.onTap,
  });

  @override
  State<CategoryTag> createState() => _CategoryTagState();
}

class _CategoryTagState extends State<CategoryTag> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.onTap?.call(isSelected);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? context.colorScheme.primary : Colors.transparent,
          border: Border.all(width: 2.0, color: context.colorScheme.primary),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Text(
              widget.coffeeType.name.toUpperCase(),
              style: TextStyle(
                color: isSelected ? Colors.white : context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 4.0),
              const Icon(
                Icons.close,
                size: 20.0,
                color: Colors.white,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
