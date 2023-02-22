import 'package:flutter/material.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/styles.dart';
import 'filter_option_chip.dart';
import 'sorting_option_chip.dart';

class FilterOptionsSection extends StatelessWidget {
  const FilterOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filter',
              style: Styles.textStyle18,
            ),
            const SizedBox(height: 10),
            ...List.generate(
              SearchFilterOption.values.length,
              (index) => FilterOptionChip(
                filterOption: SearchFilterOption.values[index],
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'OrderedBy',
              style: Styles.textStyle18,
            ),
            const SizedBox(height: 10),
            ...List.generate(
              SearchSortingOption.values.length,
              (index) => SortingOptionChip(
                sortOption: SearchSortingOption.values[index],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
