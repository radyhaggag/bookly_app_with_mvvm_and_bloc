import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/extensions.dart';
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
        buildWhen: (previous, current) {
          if (current is FeaturedBooksLoading ||
              current is FeaturedBooksLoadingSuccess ||
              current is FeaturedBooksLoadingFailed) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is FeaturedBooksLoadingSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FeaturedBookItem(
                  isClickable: true,
                  book: state.books[index],
                ),
              ),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
            );
          } else if (state is FeaturedBooksLoadingFailed) {
            return CustomErrorWidget(message: state.message);
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: CustomShimmer(radius: 10),
                ),
              ),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            );
          }
        },
      ),
    );
  }
}
