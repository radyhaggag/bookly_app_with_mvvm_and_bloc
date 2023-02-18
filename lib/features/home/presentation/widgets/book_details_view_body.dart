import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/extensions.dart';
import 'book_details_custom_app_bar.dart';
import 'custom_book_item.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kMainHorizontalPadding,
        vertical: 15,
      ),
      child: Column(
        children: [
          const BookDetailsCustomAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * .17,
            ),
            child: const CustomBookItem(isClickable: false),
          ),
        ],
      ),
    );
  }
}
