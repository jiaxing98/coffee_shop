import 'package:coffee_shop/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class CategoryTag extends StatelessWidget {
  final String tagName;
  final void Function()? onTap;

  const CategoryTag({
    super.key,
    required this.tagName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: context.colorScheme.primary),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Text(
              tagName,
              style: TextStyle(color: context.colorScheme.primary, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 4.0),
            Icon(
              Icons.close,
              size: 20.0,
              color: context.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
