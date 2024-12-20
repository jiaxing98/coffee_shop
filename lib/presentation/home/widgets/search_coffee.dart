import 'package:coffee_shop/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class SearchCoffee extends StatelessWidget {
  const SearchCoffee({super.key});

  @override
  Widget build(BuildContext context) {
    const height = 52.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style:
                    context.textStyle.bodyLarge?.copyWith(color: context.colorScheme.onSecondary),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: context.colorScheme.secondary,
                  hintText: "Search Coffee",
                  hintStyle: context.textStyle.bodyLarge?.copyWith(color: Colors.grey.shade500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.0),
            AspectRatio(
              aspectRatio: 1,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {},
                child: Icon(Icons.tune),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
