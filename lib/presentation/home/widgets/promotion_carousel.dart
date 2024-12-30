import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_shop/core/const/images.dart';
import 'package:coffee_shop/core/extensions/build_context.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class PromotionCarousel extends StatelessWidget {
  const PromotionCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        viewportFraction: 1,
        autoPlay: true,
      ),
      items: [1, 2, 3, 4, 5].mapIndexed(
        (index, e) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: index == 0
                ? Image.asset(
                    Images.promotionBanner,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Text(
                      'Promotion $e',
                      style: context.textStyle.displayMedium?.copyWith(color: Colors.white),
                    ),
                  ),
          );
        },
      ).toList(),
    );
  }
}
