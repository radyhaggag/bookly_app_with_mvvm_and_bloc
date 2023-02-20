import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'package:bookly_app/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import 'book_details_actions.dart';
import 'book_rating.dart';
import 'featured_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * .2,
          ),
          child: FeaturedBookItem(
            isClickable: false,
            book: book,
          ),
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
        if (book.volumeInfo.averageRating != null) ...[
          BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
            rating: book.volumeInfo.averageRating!,
          ),
          const SizedBox(height: 36),
        ],
        const BookDetailsActions(),
      ],
    );
  }
}
