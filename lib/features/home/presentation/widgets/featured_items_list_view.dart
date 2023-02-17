import 'package:flutter/material.dart';

import 'package:bookly_app/core/utils/extensions.dart';

import 'featured_item.dart';

class FeaturedItemsListView extends StatelessWidget {
  const FeaturedItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.3,
      child: ListView.separated(
        itemBuilder: (context, index) => const FeaturedItem(),
        separatorBuilder: (context, index) => const SizedBox(
          width: 12,
        ),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
