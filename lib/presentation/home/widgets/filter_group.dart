import 'package:coffee_shop/core/extension/build_context_extension.dart';
import 'package:coffee_shop/domain/models/coffee.dart';
import 'package:coffee_shop/presentation/home/widgets/category_tag.dart';
import 'package:flutter/material.dart';

class FilterGroup extends SliverPersistentHeaderDelegate {
  final double height;
  final void Function(List<CoffeeType>)? onTap;

  const FilterGroup({
    required this.height,
    required this.onTap,
  });

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: overlapsContent ? context.colorScheme.background : Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: _StatefulFilterGroup(onTap: onTap),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _StatefulFilterGroup extends StatefulWidget {
  final void Function(List<CoffeeType>)? onTap;

  const _StatefulFilterGroup({
    super.key,
    required this.onTap,
  });

  @override
  State<_StatefulFilterGroup> createState() => _StatefulFilterGroupState();
}

class _StatefulFilterGroupState extends State<_StatefulFilterGroup> {
  final List<CoffeeType> filters = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: CoffeeType.values.length,
      itemBuilder: (context, index) {
        final coffeeType = CoffeeType.values[index];

        return CategoryTag(
          coffeeType: coffeeType,
          onTap: (isSelected) {
            isSelected ? filters.add(coffeeType) : filters.remove(coffeeType);
            widget.onTap?.call(filters);
          },
        );
      },
    );
  }
}
