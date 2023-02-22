import 'package:flutter/material.dart';

import '../../../../core/models/book_model.dart';
import '../widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(book: book),
      ),
    );
  }
}
