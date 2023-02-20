import 'package:bookly_app/core/widgets/center_loading_indicator.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';

import 'package:bookly_app/core/utils/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import 'featured_book_item.dart';

class FeaturedItemsListView extends StatelessWidget {
  const FeaturedItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.3,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is FeaturedBooksLoadingSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FeaturedBookItem(
                    isClickable: true, book: state.books[index]),
              ),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            );
          } else if (state is FeaturedBooksLoadingFailed) {
            return CustomErrorWidget(message: state.message);
          } else {
            return const CenterLoadingIndicator();
          }
        },
      ),
    );
  }
}
