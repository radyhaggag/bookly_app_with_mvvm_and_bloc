import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import 'search_result_section.dart';
import 'search_text_field_section.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kMainHorizontalPadding,
        vertical: 15,
      ),
      child: Column(
        children: const [
          SearchTextFieldSection(),
          SizedBox(height: 15),
          Expanded(child: SearchResultSection()),
        ],
      ),
    );
  }
}