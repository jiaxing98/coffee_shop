import 'package:coffee_shop/core/extension/build_context_extension.dart';
import 'package:coffee_shop/presentation/home/widgets/category_tag.dart';
import 'package:flutter/material.dart';

class FilterGroup extends SliverPersistentHeaderDelegate {
  final double height;

  const FilterGroup({required this.height});

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: overlapsContent ? context.colorScheme.background : Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryTag(tagName: "nice $index");
        },
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
