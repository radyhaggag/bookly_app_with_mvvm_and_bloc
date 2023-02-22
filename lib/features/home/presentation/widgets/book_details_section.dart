import 'package:flutter/material.dart';

import '../../../../core/models/book_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/extensions.dart';
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
        Text(
          book.volumeInfo.title,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          book.volumeInfo.authors?.join(', ') ?? '',
          style: Styles.textStyle18.copyWith(
            color: AppColors.greyColor.withOpacity(.7),
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 18),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(height: 36),
        BookDetailsActions(book: book),
      ],
    );
  }
}
