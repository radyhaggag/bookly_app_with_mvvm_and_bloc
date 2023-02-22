import 'package:flutter/material.dart';

import '../../../../core/models/book_model.dart';
import '../../../../core/utils/constants.dart';
import 'book_details_custom_app_bar.dart';
import 'book_details_section.dart';
import 'book_details_similar_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kMainHorizontalPadding,
              vertical: 15,
            ),
            child: Column(
              children: [
                const BookDetailsCustomAppBar(),
                BookDetailsSection(book: book),
                const Expanded(
                  child: SizedBox(height: 50),
                ),
                const BookDetailsSimilarSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
