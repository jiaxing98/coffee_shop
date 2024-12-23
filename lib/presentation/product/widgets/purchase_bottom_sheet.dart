import 'package:coffee_shop/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class PurchaseBottomSheet extends StatelessWidget {
  final String price;
  final void Function()? onPurchase;

  const PurchaseBottomSheet({
    super.key,
    required this.price,
    required this.onPurchase,
  });

  @override
  Widget build(BuildContext context) {
    final height = context.mqSize.height / 8;

    return Container(
      height: height,
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, context.padding.bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: context.textStyle.bodySmall?.copyWith(color: Colors.grey.shade500),
              ),
              Text(
                price,
                style: context.textStyle.bodyLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            onPressed: onPurchase,
            child: Text(
              "Buy Now",
              style: context.textStyle.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
