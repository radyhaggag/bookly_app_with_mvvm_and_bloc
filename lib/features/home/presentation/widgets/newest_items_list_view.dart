import 'package:flutter/material.dart';

import 'book_item.dart';

class NewestItemsListView extends StatelessWidget {
  const NewestItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: BookItem(),
      ),
      itemCount: 10,
    );
  }
}
