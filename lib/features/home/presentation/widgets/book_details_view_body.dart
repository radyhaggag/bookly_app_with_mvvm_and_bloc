import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/styles.dart';
import 'book_details_custom_app_bar.dart';
import 'book_details_actions.dart';
import 'book_rating.dart';
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
              horizontal: context.screenWidth * .2,
            ),
            child: const CustomBookItem(isClickable: false),
          ),
          const SizedBox(height: 43),
          const Text(
            'The Jungle Book',
            style: Styles.textStyle30,
          ),
          const SizedBox(height: 6),
          Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(
              color: AppColors.greyColor.withOpacity(.7),
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 18),
          const BookRating(mainAxisAlignment: MainAxisAlignment.center),
          const SizedBox(height: 36),
          const BookDetailsActions(),
        ],
      ),
    );
  }
}