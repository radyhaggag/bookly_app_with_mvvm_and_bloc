import 'package:flutter/material.dart';

import 'package:bookly_app/core/utils/styles.dart';

import '../../../../core/utils/constants.dart';
import 'best_seller_items_list_view.dart';
import 'featured_items_list_view.dart';
import 'home_view_custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kHomeHorizontalPadding,
                ),
                child: HomeViewCustomAppBar(),
              ),
              FeaturedItemsListView(),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kHomeHorizontalPadding,
                ),
                child: Text('Best Seller', style: Styles.textStyle18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kHomeHorizontalPadding,
              ),
              child: BestSellerItemsListView(),
            ),
          ),
        ),
      ],
    );
  }
}