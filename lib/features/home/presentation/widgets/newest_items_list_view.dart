import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/book_shimmer.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/detailed_book_item.dart';
import '../bloc/home_bloc.dart';

class NewestItemsListView extends StatelessWidget {
  const NewestItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        if (current is NewestBooksLoading ||
            current is NewestBooksLoadingSuccess ||
            current is NewestBooksLoadingFailed) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is NewestBooksLoadingSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: DetailedBookItem(book: state.books[index]),
            ),
            itemCount: state.books.length,
          );
        } else if (state is NewestBooksLoadingFailed) {
          return CustomErrorWidget(message: state.message);
        } else {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: BookShimmer(),
            ),
            itemCount: 10,
            scrollDirection: Axis.vertical,
          );
        }
      },
    );
  }
}
