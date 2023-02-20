import 'package:bookly_app/core/widgets/center_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_error_widget.dart';
import '../bloc/home_bloc.dart';
import 'newest_book_item.dart';

class NewestItemsListView extends StatelessWidget {
  const NewestItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is NewestBooksLoadingSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: NewestBookItem(book: state.books[index]),
            ),
            itemCount: state.books.length,
          );
        } else if (state is NewestBooksLoadingFailed) {
          return CustomErrorWidget(message: state.message);
        } else {
          return const CenterLoadingIndicator();
        }
      },
    );
  }
}
