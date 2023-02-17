import 'package:flutter/material.dart';

import 'best_seller_item.dart';

class BestSellerItemsListView extends StatelessWidget {
  const BestSellerItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: BestSellerItem(),
      ),
      itemCount: 10,
    );
  }
}
