import 'package:coffee_shop/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

class LocationInfo extends StatelessWidget {
  final String address;

  const LocationInfo({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: context.textStyle.bodyMedium?.copyWith(color: Colors.grey.shade500),
        ),
        Row(
          children: [
            Text(
              address,
              style: context.textStyle.bodyLarge?.copyWith(color: Colors.white),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade500,
            ),
          ],
        )
      ],
    );
  }
}
