import 'package:flutter/material.dart';

import '../../../../core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import 'filter_options_section.dart';

class SearchSelectionOptions extends StatelessWidget {
  const SearchSelectionOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 45,
        top: 10,
      ),
      child: Container(
        width: context.screenWidth,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor.withOpacity(.4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: const [
            FilterOptionsSection(),
          ],
        ),
      ),
    );
  }
}
