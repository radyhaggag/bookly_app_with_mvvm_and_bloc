import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/book_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: BookItem(),
      ),
      itemCount: 10,
    );
  }
}
