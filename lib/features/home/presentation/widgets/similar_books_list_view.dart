import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_shimmer.dart';
import '../bloc/home_bloc.dart';
import 'featured_book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.15,
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) {
          if (current is SimilarBooksLoading ||
              current is SimilarBooksLoadingSuccess ||
              current is SimilarBooksLoadingFailed) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is SimilarBooksLoadingSuccess) {
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
          } else if (state is SimilarBooksLoadingFailed) {
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
