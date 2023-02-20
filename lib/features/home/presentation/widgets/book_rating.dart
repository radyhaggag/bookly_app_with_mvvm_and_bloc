import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bookly_app/core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
  });

  final double rating;

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 16,
        ),
        const SizedBox(width: 6.5),
        Text(
          rating.toString(),
          style: Styles.textStyle18,
        ),
        const SizedBox(width: 5),
        Text(
          '(2468)',
          style: Styles.textStyle14.copyWith(
            color: AppColors.whiteColor.withOpacity(.5),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
