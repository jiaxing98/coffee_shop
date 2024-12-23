import 'package:coffee_shop/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

enum CoffeeSize { s, m, l }

class SelectSize extends StatelessWidget {
  final CoffeeSize? selectedSize;
  final void Function(CoffeeSize) onSizeSelected;

  const SelectSize({
    super.key,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: context.textStyle.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: CoffeeSize.values
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    onSizeSelected.call(e);
                  },
                  child: Container(
                    height: 40.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      color: selectedSize == e ? context.colorScheme.onPrimary : Colors.white54,
                      border: Border.all(
                          color: selectedSize == e
                              ? context.colorScheme.primary
                              : Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        e.name.toUpperCase(),
                        style: selectedSize == e
                            ? TextStyle(color: context.colorScheme.primary)
                            : null,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
