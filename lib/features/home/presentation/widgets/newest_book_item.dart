import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/book_model/book_model.dart';
import '../../../../core/config/app_router.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/styles.dart';
import 'book_rating.dart';

class NewestBookItem extends StatelessWidget {
  const NewestBookItem({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push(
        AppRouter.bookDetailsView,
        extra: book,
      ),
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(book.volumeInfo.imageLinks.thumbnail),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.screenWidth * .5,
                    child: Text(
                      'Harry potter and the Goblet of Fire',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGTSectraFont,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    "J.K Rowling",
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "19.99 £",
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const BookRating(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
