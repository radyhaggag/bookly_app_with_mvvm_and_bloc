import 'package:flutter/material.dart';

import 'package:bookly_app/core/utils/styles.dart';

import 'best_seller_item.dart';
import 'featured_items_list_view.dart';
import 'home_view_custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HomeViewCustomAppBar(),
          FeaturedItemsListView(),
          SizedBox(height: 50),
          Text('Best Seller', style: Styles.titleMedium),
          SizedBox(height: 15),
          BestSellerItem(),
        ],
      ),
    );
  }
}
