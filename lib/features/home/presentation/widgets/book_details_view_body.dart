import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_details_custom_app_bar.dart';
import 'package:flutter/material.dart';

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
        children: const [
          BookDetailsCustomAppBar(),
        ],
      ),
    );
  }
}
