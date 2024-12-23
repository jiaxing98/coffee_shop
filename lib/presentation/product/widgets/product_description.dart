import 'package:coffee_shop/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatefulWidget {
  final String description;

  const ProductDescription({
    super.key,
    required this.description,
  });

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: context.textStyle.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            widget.description,
            maxLines: isExpanded ? null : 5,
            overflow: isExpanded ? null : TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey.shade500),
          ),
        ),
      ],
    );
  }
}
