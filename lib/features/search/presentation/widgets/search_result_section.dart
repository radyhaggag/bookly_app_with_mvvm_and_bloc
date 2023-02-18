import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import 'search_result_list_view.dart';

class SearchResultSection extends StatelessWidget {
  const SearchResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Search Result',
          style: Styles.textStyle18,
        ),
        SizedBox(height: 15),
        Expanded(
          child: SearchResultListView(),
        ),
      ],
    );
  }
}
