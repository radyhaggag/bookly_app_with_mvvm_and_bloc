import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_router.dart';
import '../../../../core/models/book_model.dart';
import 'custom_book_image.dart';

class FeaturedBookItem extends StatelessWidget {
  const FeaturedBookItem({
    super.key,
    required this.isClickable,
    required this.book,
  });

  final bool isClickable;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isClickable
          ? () => GoRouter.of(context).push(
                AppRouter.bookDetailsView,
                extra: book,
              )
          : null,
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CustomBookImage(
          imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
        ),
      ),
    );
  }
}
